class AddAdminFlagToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :bool, :null => false, :default => false
  end
end
