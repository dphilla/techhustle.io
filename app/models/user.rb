class User < ApplicationRecord
  has_secure_password
  has_many :user_connections
  has_many :connections, through: :user_connections

  validates :username, presence: true, uniqueness: true
  enum role: ["default", "admin"]


  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create! do |new_user|
      new_user.uid                = auth_info.uid
      new_user.username           = auth_info.info.name
      new_user.email              = auth_info.info.email
      new_user.image_url          = auth_info.info.image
      new_user.token              = auth_info.credentials.token    #expires after 6 mos
      new_user.id_token           = auth_info.extra.id_token
      new_user.password           = SecureRandom.hex(9)
    end
  end

  def self.sort_by_mutual_connections(current_user)
    #ids = current_user.connections.ids
    #user.joins(:connections).order('connections.id DESC').limit(5)       #optimize this to order by users with most similar contacts
    all
  end

end
