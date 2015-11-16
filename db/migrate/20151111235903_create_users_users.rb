class CreateUsersUsers < ActiveRecord::Migration
  def change
    create_table "users_users", :force => true, :id =>false do |t|
      t.integer :friender
      t.integer :friend
      t.timestamps null: false
    end
  end
end
