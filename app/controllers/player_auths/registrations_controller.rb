class PlayerAuths::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]
  before_action :is_authenticated, only: [:show]

  # GET /resource/sign_up
  #def new
  #  super
  #end

  # POST /resource
  def create
  end

  def show
  end


  protected



  def is_authenticated
    # TODO: Adicionar condições mais tarde
    respond_to do |format|
      if !player_auth_signed_in?
        format.html { redirect_to new_player_auth_session_path	}
      end
    end
  end

  protected
  def after_update_path_for(resource)
    edit_player_auth_registration_path(resource)
  end
end
