ActiveAdmin.register User do
  index do
    column :name     
    column :id
    column :email
    column 'is Admin?' , :admin
    default_actions
  end
end
