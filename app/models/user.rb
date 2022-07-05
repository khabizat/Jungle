class User < ApplicationRecord

  has_secure_password

  validates :name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def authenticate_with_credentials(email, password)
    #squish removes whitespace
    user = User.find_by_email(email.squish.downcase)
    # If the user exists AND the password entered is correct
    if user && user.authenticate(password)
      return user
    else
      nil
  end

  end



  
end
