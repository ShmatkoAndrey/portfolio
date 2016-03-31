class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, :presence => true, :uniqueness => {:case_sensitive => false }, format: { with: VALID_EMAIL_REGEX }


  has_many :identities, dependent: :destroy
  has_many :dropzone_files, dependent: :destroy
  has_many :votes, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  def self.find_for_oauth(auth, signed_in_resource = nil)
    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user
    if user.nil?
      email = auth.extra.raw_info.email
      user = User.where(:email => email).first if email
      user.update(remote_avatar_url: auth.info.image.gsub('http://','https://') + '?type=large') if !user.nil? && !user.avatar?
      if user.nil?
        user = User.new(
            remote_avatar_url: auth.info.image.gsub('http://','https://') + '?type=large',
            email: auth.extra.raw_info.email,
            password: Devise.friendly_token[0,20]
        )
        user.save!
      end
    end

    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

end