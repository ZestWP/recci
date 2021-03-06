class User < ActiveRecord::Base
  #attr_accessible :email, :password, :password_confirmation
  
 
  
  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_presence_of :level
  validates_uniqueness_of :email
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def self.valid(password, password_confirmation)
	if password != "" && password_confirmation != "" && password_confirmation == password
	 return true
	else
	 return false
	end
  end
  
  def encrypt_password
    if password.present?
		require 'bcrypt'
  silence_warnings do
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
    end
  end
end