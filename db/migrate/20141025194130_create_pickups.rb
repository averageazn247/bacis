class CreatePickups < ActiveRecord::Migration
  def change
    create_table :pickups do |t|
      t.float :userid
      t.string :name
      t.string :address
      t.float :start_lat
      t.float :start_long
      t.float :end_lat
      t.float :end_long
      t.timestamps
    end
  end
end
