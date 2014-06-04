class RemoveTitleToEvents < ActiveRecord::Migration
  def up
    remove_column :events, :name
  end

  def down
    add_column :events, :name, :string
  end
end
