class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  #Association
  has_many :messages
  has_many :groups

  #Validation
  validates :email, presence: true, on: :update
  validates :name, presence: true, on: :update
  validates :about, presence: true, on: :update
  validates :web, presence: true, on: :update
  validates :address, presence: true, on: :update
  validates :industry, presence: true, on: :update
  validates :sns, presence: true, on: :update
  validates :image, presence: true, on: :update


  mount_uploader :image, ImageUploader
end
