ActiveAdmin.register User do

  index do
    column :id
    column :username
    column :email
    column :created_at
    column :admin
    default_actions
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :username
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.buttons
  end
end
