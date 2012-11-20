ActiveAdmin.register Comment do

  index do
    column :id
    column :body
    column :created_at
    default_actions
  end

end

