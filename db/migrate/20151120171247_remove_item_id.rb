class RemoveItemId < ActiveRecord::Migration
  def change
    remove_column :mapitems, :item_id
  end
end
