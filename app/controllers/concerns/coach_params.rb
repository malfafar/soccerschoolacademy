class CoachParams < Devise::ParameterSanitizer
  def sign_in
    default_params.permit( :email, :current_password)
  end

  def sign_up
     default_params.permit( :email, :name, :password, :password_confirmation, :phone)
  end

  def account_update
      default_params.permit( :email, :name, :password, :password_confirmation, :current_password,
                            :phone)
  end
end
