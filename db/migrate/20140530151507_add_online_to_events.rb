class AddOnlineToEvents < ActiveRecord::Migration
  def change
    add_column :events, :isOnline, :boolean
  end
end
