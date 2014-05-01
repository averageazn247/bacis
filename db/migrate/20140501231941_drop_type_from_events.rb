class DropTypeFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :type
    add_column :events, :cat, :string
  
  end
end
