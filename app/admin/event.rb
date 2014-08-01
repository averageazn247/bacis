ActiveAdmin.register Event do
 
 batch_action :approve do |selection|
      Event.find(selection).each do |post|
        post.approve = true
        post.save
      end
        redirect_to :back  
    end
    
 batch_action :disapprove do |selection|
      Event.find(selection).each do |post|
        post.approve = false
        post.save
      end
        redirect_to :back  
    end    
  index do
   

    column :title
    column :address
    column 'catorgory', :cat 
    column 'Creator id', :maker
    
    column 'Approved?', :approve
    selectable_column
    column :desc
    
    column 'start date', :dayof, :sortable => :datof do |event|
      div :class => "dayof" do
     event.dayof
      end
      
    end
    default_actions
  end
end
