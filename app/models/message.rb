class Message < ActiveRecord::Base
  #Association
  belongs_to :user
  belongs_to :admin
  belongs_to :group
end
