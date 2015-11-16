class AddAlignmentIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :aligment_id, :integer
    remove_column :users, :alignment
  end
end
