class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :session_token, uniqueness: true
  validates :password, length: {minimum: 6, allow_nil: true}

  def password=(password)
    @password = password
  end

  def password
    @password
  end

end

#create a current user method
#display the current user at the top of the page


#auth set up

#users class variables:
#password_digest
#email
#session token

#users controller
#new user
#create user

#users class methods
#create bcrypt password (for sign up)
#check password (for log in)
#create session controller
#sign out user (will call session controller method)

#session controller
#destroy (sign out user)
#create (sign in user)

#creating BCrypt password -> 

