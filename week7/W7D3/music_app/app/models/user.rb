# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    #database contraints
    validates :email, :password_digest, :session_token, presence: true
    validates :email, :session_token, uniqueness: true

    attr_reader :password
    after_initialize :ensure_session_token

    #SPIRE

    #User::find_by_credentials
    def self.find_by_credentials(email,password)
        user = User.find_by(email: email)
        if user && user.is_password?(password)
            user
        else
            nil
        end
    end
   
    #user#reset_session_token!
    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save! #password is always nil when we save! because there is no password col.
        self.session_token
    end

    def ensure_session_token
        self.session_token ||=  SecureRandom::urlsafe_base64 #generates random string and sets session_token
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    
    private
    # helper method to replace all SecureRnadom::urlsafe_base64 if neeeded but not necessary
    # def self.generate_session_token
    #     generate_token = SecureRandom::urlsafe_base64
    # end

end
