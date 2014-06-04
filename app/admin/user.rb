ActiveAdmin.register User do
  index do
    column :name     
    column :id
    column :email
    column 'is Admin?' , :admin
    column 'power level', :power
    default_actions
  end
end
