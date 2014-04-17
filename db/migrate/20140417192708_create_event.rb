class CreateEvent < ActiveRecord::Migration
 def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.time :start
      t.text :desc
      t.text :address
      t.text :prizes
      t.text :cost
      t.string :host
      t.string :type
    end
  end
end
