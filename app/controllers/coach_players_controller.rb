class CoachPlayersController < ApplicationController

  before_action :authenticate_coach!


  before_action :set_player, only: [:edit, :show, :add_medical, :update]

  layout 'admin'
  def new
    @player = Player.new
    @player.build_player_auth
    @player.build_guardian
    @player.guardian.build_guardian_auth
    @player.build_school
    # @player_auth = PlayerAuth.new
    if session[:player_errors]
      session[:player_errors].each {|error, error_message| @player_auth.errors.add error, error_message}
      session.delete :player_errors
    end
  end

  def create

    custom_params = player_params

    if params[:player].has_key? :player_auth_attributes
      player_auth_email_exists = !params[:player][:player_auth_attributes][:email].blank?
    else
      player_auth_email_exists = true
    end
    guardian_attributes_exists = player_params.has_key?(:guardian_attributes)

    if guardian_attributes_exists
      guardian_params = player_params[:guardian_attributes]
      guardian_auth_attributes_exists = guardian_params.has_key?(:guardian_auth_attributes)

      if guardian_auth_attributes_exists
        guardian_auth_params = player_params[:guardian_attributes][:guardian_auth_attributes]
        guardian_auth_email_exists = !guardian_auth_params[:email].blank?
      end
    end

    guardian_is_not_existent = (player_params[:guardian_id] == -1.to_s)
    exams_attributes_exists = player_params.has_key?(:exams_attributes)

    if exams_attributes_exists
      exams_params = player_params[:exams_attributes]
    end

    school_attributes_exists = player_params.has_key?(:school_attributes)

    if school_attributes_exists
      school_params = player_params[:school_attributes]
    end


    school_id_exists =  player_params.has_key?(:school_id)


    # verifications
    if guardian_is_not_existent
      custom_params = custom_params.except(:guardian_id)
    end

    if guardian_attributes_exists
      if guardian_auth_attributes_exists
        if !guardian_auth_email_exists
          custom_params[:guardian_attributes] = custom_params[:guardian_attributes].except(:guardian_auth_attributes)
        end
      end
    end

    if !player_auth_email_exists
      custom_params = custom_params.except(:player_auth_attributes)
    end

    puts player_params.inspect.colorize(:red)
    new_player = Player.new(custom_params)

    if school_attributes_exists
      school = create_school(school_params)
      new_player.school = school
    elsif school_id_exists
      new_player.school_id = player_params[:school_id]
    end

    @player = new_player
    puts @player.player_auth

    respond_to do |format|
      if @player.save
        format.html { redirect_to coach_index_players_path, notice: 'Player was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
  end

  def edit
    if !@player.player_auth
      @player.build_player_auth
    end
    if !@player.guardian
      @player.build_guardian

      if !@player.guardian.guardian_auth
        @player.build_guardian.build_guardian_auth
      end

    end

    # if !@player.exams
    #   @player.build_exams
    # end

    if !@player.school
      @player.build_school
    end

  end

  def index

    params.permit(:search)
    if params[:search]
      @players = Kaminari.paginate_array(Player.includes(:player_auth, :school).search(params[:search])).page(params[:page]).per(30)
    else
      @players = Player.includes(:player_auth, :school).order(:name).page(params[:page]).per(30)
    end
  end

  def add_medical
    @player.medicals << params[:medical_date]
    @player.save
    @medical = params[:medical_date]
    if @player.persisted?
      @flag = true
    else
      @flag = false
    end
  end

  def update
    custom_params = player_params

    if params[:player].has_key? :player_auth_attributes
      player_auth_email_exists = !params[:player][:player_auth_attributes][:email].blank?
    else
      player_auth_email_exists = true
    end
    guardian_attributes_exists = player_params.has_key?(:guardian_attributes)

    if guardian_attributes_exists
      guardian_params = player_params[:guardian_attributes]
      guardian_auth_attributes_exists = guardian_params.has_key?(:guardian_auth_attributes)

      if guardian_auth_attributes_exists
        guardian_auth_params = player_params[:guardian_attributes][:guardian_auth_attributes]
        guardian_auth_email_exists = !guardian_auth_params[:email].blank?
      end
    end

    guardian_is_not_existent = (player_params[:guardian_id] == -1.to_s)
    exams_attributes_exists = player_params.has_key?(:exams_attributes)

    if exams_attributes_exists
      exams_params = player_params[:exams_attributes]
    end

    school_attributes_exists = player_params.has_key?(:school_attributes)

    if school_attributes_exists
      school_params = player_params[:school_attributes]
    end


    school_id_exists =  !player_params[:school_id].blank?


    # verifications
    if guardian_is_not_existent
      custom_params = custom_params.except(:guardian_id)
    end

    if guardian_attributes_exists
      if guardian_auth_attributes_exists
        if !guardian_auth_email_exists
          custom_params[:guardian_attributes] = custom_params[:guardian_attributes].except(:guardian_auth_attributes)
        end
      end
    end

    if !player_auth_email_exists
      custom_params = custom_params.except(:player_auth_attributes)
    end

    @player.assign_attributes(custom_params)

    if school_attributes_exists
      new_school = create_school(school_params)
      @player.school = new_school
    elsif school_id_exists
      @player.school_id = player_params[:school_id]
    end

    respond_to do |format|
      if @player.save
        format.html { redirect_to coach_index_players_path, notice: 'Player was successfully updated.' }
      else
        if !@player.player_auth
          @player.build_player_auth
        end
        format.html { render :edit }
      end
    end

  end



  protected

    def create_school(school_params)
      school = School.create!(name: school_params[:name])
      return school
    end

  private

    def set_player
      puts params.inspect.colorize(:green)
      if params.has_key?(:id)
        puts "ID".colorize(:blue)
        puts params[:id]
        @player= Player.find(params[:id])
      end
    end

    def player_params
      params.require(:player).permit(:name, :birthday, :avatar, :address, :district,
      :zipcode, :phone, :id_card_number, :vat_id,  :birthplace, :nationality,
      :guardian_id, :second_parent, :guardian_family_degree, :_destroy, :id,
      :school_id, school_attributes:[:name, :id, :_destroy],
      player_auth_attributes: [:id,  :email, :password],
      guardian_attributes:[:name, :phone,:id, :_destroy,
      guardian_auth_attributes:[:email, :password, :password_confirmation, :id]],
      exams_attributes: [:id, :exam_date, :weight, :height])
    end

end
