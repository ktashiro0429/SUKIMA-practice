class Group < ActiveRecord::Base
  #Association
  has_many :messages
  belongs_to :user
  belongs_to :admin
end
