class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  validates :email, :presence => true, :uniqueness => {:case_sensitive => false }

  has_many :identities
  has_many :dropzone_files

  mount_uploader :avatar, AvatarUploader

  def self.find_for_oauth(auth, signed_in_resource = nil)
    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user
    if user.nil?
      email = auth.extra.raw_info.email
      user = User.where(:email => email).first if email
      user.update(remote_avatar_url: auth.info.image.gsub('http://','https://') + '?type=large') unless user.avatar?
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