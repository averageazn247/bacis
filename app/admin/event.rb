ActiveAdmin.register Event do
 
  
  index do
    column :name
    column :title
    column :address
    column 'catorgory', :cat 
    column :dayof, :sortable => :datof do |event|
      div :class => "dayof" do
     event.dayof
      end
    end
    default_actions
  end
end
