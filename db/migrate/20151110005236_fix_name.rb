class FixName < ActiveRecord::Migration
  def change
    remove_column :users, :aligment_id
    add_column :users, :alignment_id, :integer
  end
end
