ActiveAdmin.register User do
  
   batch_action :make_admin do |user|
      User.find(user).each do |post|
        post.admin = true
        post.save
      end
        redirect_to :back  
    end
       batch_action :remove_admin do |user|
      User.find(user).each do |post|
        post.admin = false
        post.save
      end
        redirect_to :back  
    end
  index do
    column :name     
    column :id
    column :email
    column 'is Admin?' , :admin
      selectable_column
    column 'power level', :power
    default_actions
  end
end
