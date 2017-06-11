class Message < ActiveRecord::Base
  #Association
  has_many :users
  has_many :admins
end
