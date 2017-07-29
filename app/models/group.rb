class Group < ActiveRecord::Base
  #Association
  has_many :messages
  belongs_to :user
  belongs_to :admin
  belongs_to :entry
end
