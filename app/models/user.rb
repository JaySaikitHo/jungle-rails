class User < ActiveRecord::Base
   
   def self.authenticate_with_credentials(email, password)
      user = User.find_by_email((email.strip).downcase)
      if user && user.authenticate(password)
        user
      end
    end

   has_secure_password
   
   
   
   validates :first_name, presence: true
   validates :last_name, presence: true
   validates :email, uniqueness: { case_sensitive: false}
   validates :password_confirmation, presence: true
   validates :password, length: { in: 3..20 }
   before_save :downcase_email

  def downcase_email
    self.email.downcase!
  end

end
