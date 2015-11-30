class CreateItemtypes < ActiveRecord::Migration
  def change
    create_table :itemtypes do |t|
      t.string :name
      t.integer :basehealth
      t.integer :capacity
      t.timestamps null: false
    end
  end
end
