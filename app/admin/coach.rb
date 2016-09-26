ActiveAdmin.register Coach do
  permit_params :email, :password, :password_confirmation, :name, :phone

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :phone
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :name
  filter :phone
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Coach Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :name
      f.input :phone
    end
    f.actions
  end

end
