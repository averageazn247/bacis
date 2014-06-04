class AddPowerToUser < ActiveRecord::Migration
  def change
    add_column :users, :power, :string
    add_column :events, :approve, :boolean
  end
end
