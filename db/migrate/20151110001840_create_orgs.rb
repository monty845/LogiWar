class CreateOrgs < ActiveRecord::Migration
  def change
    create_table :orgs do |t|
      t.string :orgname
      t.timestamps null: false
    end
  end
end
