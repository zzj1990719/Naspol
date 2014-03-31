class User < ActiveRecord::Base
  has_and_belongs_to_many :websites
  has_and_belongs_to_many :pages
  has_and_belongs_to_many :reminds
  has_and_belongs_to_many :recommends
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  validates :name,  presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 8 }
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token        #创建一个记住我的标记
      self.remember_token = User.hash(User.new_remember_token)
    end
end
