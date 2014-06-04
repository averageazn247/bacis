ActiveAdmin.register Event do
 
  
  index do
   

    column :title
    column :address
    column 'catorgory', :cat 
    column 'Creator ', :maker
     form do |f|
      f.inputs do
        f.input :approve, as: :check_boxes
      # other fields...
      end
    end
    column :desc
    column :dayof, :sortable => :datof do |event|
      div :class => "dayof" do
     event.dayof
      end
    end
    default_actions
  end
end
