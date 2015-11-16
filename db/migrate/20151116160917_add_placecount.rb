class AddPlacecount < ActiveRecord::Migration
  def change
    add_column :users, :builtpts, :integer
  end
end
