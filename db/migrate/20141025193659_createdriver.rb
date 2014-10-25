class Createdriver < ActiveRecord::Migration
  def change
     create_table :drivers do |t|
      t.string :name
      t.string :location
      t.time :start
      t.time :end_time
      t.date :day 
      t.text :cost 
      t.string :userid
  end
end
end