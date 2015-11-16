class CreateAlignments < ActiveRecord::Migration
  def change
    create_table :alignments do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
