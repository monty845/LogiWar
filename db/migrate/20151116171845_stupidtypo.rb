class Stupidtypo < ActiveRecord::Migration
  def change
      remove_column :users, :builtpts
      add_column :users, :buildpts, :integer
  end
end
