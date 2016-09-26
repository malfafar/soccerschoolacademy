class PlayerAuthParams < Devise::ParameterSanitizer
  def sign_in
    default_params.permit( :email, :current_password)
  end

  def sign_up
     default_params.permit( :email, :password,
                            player_attributes:[:avatar, :name, :birthday, :address, :district,  :zipcode, :phone, :id_card_number, :vat_id,  :birthplace, :nationality, :school_id, :guardian_id, :_destroy,:id,
                                  guardian_attributes:[:name, :phone,:id, :_destroy, guardian_auth_attributes:[:email, :password, :password_confirmation, :id]
                            ],   exams_attributes:[:exam_date, :height, :weight, :_destroy, :id ], school_attributes:[:name, :id, :_destroy]])
  end

  def account_update
      default_params.permit( :email, :password, :password_confirmation, :current_password,
                            player_attributes:[:avatar, :name, :birthday, :address, :district,  :zipcode, :phone, :id_card_number, :vat_id,  :birthplace, :school_id, :nationality, :guardian_id, :_destroy,:id,
                                  guardian_attributes:[:name, :phone,:id, :_destroy, guardian_auth_attributes:[:email, :password, :password_confirmation, :id]
                            ],   exams_attributes:[:exam_date, :height, :weight, :_destroy, :id ], school_attributes:[:name, :id, :_destroy]])
  end
end
