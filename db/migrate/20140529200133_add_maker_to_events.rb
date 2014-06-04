class AddMakerToEvents < ActiveRecord::Migration
  def change
    add_column :events, :maker, :string
  end
end
