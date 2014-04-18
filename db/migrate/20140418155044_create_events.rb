class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.text :contact
      t.time :start
      t.text :desc
 
      t.text :address
      t.text :prizes
      t.text :cost
      t.string :host
      t.string :type
      t.timestamps
    end
  end
end
