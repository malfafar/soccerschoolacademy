class GuardianAuthPlayersController < ApplicationController
  layout 'admin'
  before_action :authenticate_guardian_auth!
  before_action :set_player, only: [:edit, :show, :update]
  def index
    @players = current_guardian_auth.guardian.players.order(:name).page(params[:page]).per(30)
  end

  def edit
    if !@player.player_auth
      @player.build_player_auth
    end
    # if @player.player_auth
    #   @player_auth = @player.player_auth
    # else
    #   @player_auth = PlayerAuth.new
    # end
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
        format.html { redirect_to guardian_index_players_path, notice: 'Player was successfully updated.' }
      else
        if !@player.player_auth
          @player.build_player_auth
        end
        format.html { render :edit }
      end
    end
  end



  def show
  end


  private

  def set_player
    @player= Player.find(params[:id])
  end

  # def player_auth_params
  #   params.require(:player_auth).permit(:id,  :email, :password,
  #                          player_attributes:[:name, :birthday, :address, :district,  :zipcode, :phone, :id_card_number, :vat_id,  :birthplace, :nationality, :guardian_id, :_destroy,:id])
  # end

  def player_params
    params.require(:player).permit(:name, :birthday, :address, :district,
    :zipcode, :phone, :id_card_number, :vat_id,  :birthplace, :nationality,
    :guardian_id, :second_parent, :guardian_family_degree, :_destroy, :id,
    :school_id, school_attributes:[:name, :id, :_destroy],
    player_auth_attributes: [:id,  :email, :password],
    guardian_attributes:[:name, :phone,:id, :_destroy,
    guardian_auth_attributes:[:email, :password, :password_confirmation, :id]],
    exams_attributes: [:id, :exam_date, :weight, :height])
  end

end
