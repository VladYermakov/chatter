class User < ApplicationRecord
  validates :name,  presence: true, length: { minimum: 4, maximum: 25 },
                                    uniqueness: true,
                                    format: { with: /\A[A-Za-z0-9_]*\z/ }

  validates :email, presence: true, uniqueness: true,
                                    format: { with: /\A[a-zA-Z0-9\-\+\.]+@([a-zA-Z0-9\-]{2,20}\.)+[a-zA-Z]{2,6}\z/i }

  scope :remembered_by, -> (admin, remember_token) do

    token = :remember_token
    token = :admin_remember_token if admin == :admin
    find_by token => remember_token
  end

  before_create do
    self.original_name = self.name
    self.name          = self.name.downcase
    self.email         = self.email.downcase
  end

  before_create :create_admin_remember_token

  has_many :messages

  has_secure_password

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
    def create_admin_remember_token
      self.admin_remember_token = self.remember_token = User.encrypt(User.new_remember_token)
    end
end
