class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :update_access_token!

  has_many :interests

  validates :username, presence: true
  validates :email, presence: true

  private

  #  Need to change to something more secure if you want to keep this token secure
  def update_access_token!
    self.access_token = "#{self.id}:#{Devise.friendly_token}"
    save
  end

  def generate_access_token
    loop do
      token = "#{self.id}:Devis.friendly_token"
      break token unless User.where(access_token: token).first
    end
  end

end
