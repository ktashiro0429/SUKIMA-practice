class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  mount_uploader :image, ImageUploader

  has_many :entries, dependent: :destroy

  #Association
  has_many :messages
  has_many :groups

  #Validation
  validates :id, presence: true, on: :update
  validates :email, presence: true, on: :update
  validates :image, presence: true, on: :update
  validates :name, presence: true, on: :update
  validates :introduce, presence: true, on: :update
  validates :education, presence: true, on: :update
  validates :atschool, presence: true, on: :update
  validates :skills, presence: true, on: :update
  validates :gender, presence: true, on: :update
  validates :address, presence: true, on: :update

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
end
