class User < ApplicationRecord

  before_save {email.downcase!}
  
  enum roles: [:Customer, :Admin, :SuperAdmin]
  
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255},
                    format: { with: VALID_EMAIL_FORMAT },
                    uniqueness: { case_sensitive: false }
  # validates :role, inclusion: { in: roles }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  
  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def admin?
    self.role == 'Admin'
  end
  
  def superadmin?
    self.role = 'SuperAdmin'
  end

end
