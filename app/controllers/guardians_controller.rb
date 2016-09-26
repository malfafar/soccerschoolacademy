class GuardiansController < ApplicationController
  before_action :authenticate_coach!, except: [:edit, :update]

  before_action :set_guardian, only: [:show, :edit, :update, :destroy]

  layout 'admin'
  # GET /guardians
  # GET /guardians.json
  def index

    params.permit(:search)

    if params[:search]
      @guardians = Kaminari.paginate_array(Guardian.includes(:guardian_auth).search(params[:search])).page(params[:page]).per(30)
    else
      @guardians = Guardian.includes(:guardian_auth).page(params[:page]).per(30)
    end
  end

  # GET /guardians/1
  # GET /guardians/1.json
  def show
  end

  # GET /guardians/new
  def new
    @guardian = Guardian.new
    @guardian_auth = GuardianAuth.new
  end

  # GET /guardians/1/edit
  def edit
    if @guardian.guardian_auth
      @guardian_auth = @guardian.guardian_auth
    else
      @guardian_auth = GuardianAuth.new
    end
  end

  # POST /guardians
  # POST /guardians.json
  def create
    @guardian = Guardian.new(guardian_params.except(:guardian_auth_attributes))
    guardian_auth_params_exist = guardian_params[:guardian_auth_attributes]

    respond_to do |format|
      if @guardian.save
        if guardian_auth_params_exist
          if !guardian_params[:guardian_auth_attributes][:email].blank?
            new_guardian_auth = GuardianAuth.create!(:email => guardian_params[:guardian_auth_attributes][:email])
            new_guardian_auth.guardian = @guardian
          end
        end
          format.html { redirect_to @guardian, notice: 'Guardian was successfully created.' }
          format.json { render :show, status: :created, location: @guardian }
      else
        format.html { render :new }
        format.json { render json: @guardian.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guardians/1
  # PATCH/PUT /guardians/1.json
  def update

    guardian_auth_params_exist = guardian_params[:guardian_auth_attributes]

    respond_to do |format|
      if @guardian.update(guardian_params.except(:guardian_auth_attributes))
        if guardian_auth_params_exist
          if !guardian_params[:guardian_auth_attributes][:email].blank?

            if @guardian.guardian_auth
              @guardian.guardian_auth.email = guardian_params[:guardian_auth_attributes][:email]
              @guardian.guardian_auth.save
            else

              new_guardian_auth = GuardianAuth.create!(:email => guardian_params[:guardian_auth_attributes][:email])
              new_guardian_auth.guardian = @guardian
            end
          end
        end
        format.html { redirect_to @guardian, notice: 'Guardian was successfully updated.' }
        format.json { render :show, status: :ok, location: @guardian }
      else
        format.html { render :edit }
        format.json { render json: @guardian.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guardians/1
  # DELETE /guardians/1.json
  def destroy
    @guardian.destroy
    respond_to do |format|
      format.html { redirect_to guardians_url, notice: 'Guardian was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guardian
      @guardian = Guardian.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guardian_params
      params.require(:guardian).permit(:name, :phone, guardian_auth_attributes:[:email])
    end
end
