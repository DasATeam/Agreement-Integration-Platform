class User < ActiveRecord::Base
	has_one(:merchant)
  
  validates(:email, uniqueness: true, format: /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$\z/i)

  def set_password(input)
    self.salt = BCrypt::Engine.generate_salt
    self.pass = BCrypt::Engine.hash_secret(input, salt)
    self.save
  end

  def password_match?(input)
    return pass == BCrypt::Engine.hash_secret(input, salt)
  end

end
