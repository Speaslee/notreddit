class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]

  validates_uniqueness_of :email

  has_many :posts
  has_many :votes
  has_many :comments

  acts_as_messageable
  mount_uploader :picture, ProfilePictureUploader

  def mailboxer_name
    self.name
  end

  def mailboxer_email(object)
    self.email
  end


  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first
    unless user
         user = User.create(name: data["name"],
            email: data["email"],
            password: Devise.friendly_token[0,20]
         )
     end
     user
   end
end
