class GuardianAuthParams < Devise::ParameterSanitizer
  def sign_in
    default_params.permit( :email, :current_password)
  end

  def sign_up
     default_params.permit( :email, :password, :password_confirmation,
                            guardian_attributes:[:name, :phone,:id, :_destroy] )
  end

  def account_update
    default_params.permit( :email, :password, :password_confirmation, :current_password,
                           guardian_attributes:[:name, :phone,:id, :_destroy] )
  end
end
