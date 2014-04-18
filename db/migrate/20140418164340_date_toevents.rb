class DateToevents < ActiveRecord::Migration
  def change  
        add_column :events, :dayof, :date
 
  end
end
