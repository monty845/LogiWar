class AddOrgIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :org_id, :integer
    remove_column :users, :orgname
  end
end
