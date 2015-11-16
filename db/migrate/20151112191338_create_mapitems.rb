class CreateMapitems < ActiveRecord::Migration
  def change
    create_table :mapitems do |t|
        t.integer :user_id
        t.integer :x
        t.integer :y
        t.integer :item_id
        t.integer :health
      t.timestamps null: false
    end
  end
end
