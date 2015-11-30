class Itemcost < ActiveRecord::Migration
  def change
    add_column :itemtypes, :cost, :integer
  end
end
