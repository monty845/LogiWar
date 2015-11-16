class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.string :token
      t.string :display_name
      t.string :location
      t.string :gender
      t.string :orgname
      t.string :title
      t.string :orgtype
      t.string :alignment
      t.timestamps null: false
    end
  end
end
