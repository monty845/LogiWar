class Mapitem < ActiveRecord::Base
  belongs_to :user
  belongs_to :itemtype
end
