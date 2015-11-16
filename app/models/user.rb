class User < ActiveRecord::Base
  has_many :mapitems
  belongs_to :org
  belongs_to :alignment
  has_and_belongs_to_many(:users,
  :join_table => "users_users",
  :foreign_key => "friender",
  :association_foreign_key => "friend")

end
