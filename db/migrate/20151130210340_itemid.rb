class Itemid < ActiveRecord::Migration
  def change
    add_column :mapitems, :itemtype_id, :integer
  end
end
