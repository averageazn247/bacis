class NameToUsers < ActiveRecord::Migration
  def chage
add_column :users, :name, :string
 
  end
end
