# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  user_name       :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  session_token   :string           not null
#
class User < ApplicationRecord

    #SPIRE:
    # self.find_by_credentials
    # password=
    # is_password?
    # resest_session_token!
    # ensure_session_token


    validates :user_name, :session_token, presence:true, uniqueness:true
    validates :password_digest, presence:true
    #creates a session token
    after_initialize :ensure_session_token
    addr_reader :password

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64 
    end


    #Adding User#reset_session_token!
    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save! #password is always nil when we save! because there is no password col
        self.session_token
    end

    #Add #password=(password) setter method.
    #Uses BCrypt::Password.create() to encrypt and set the password to @password.
    def password=(password) 
        #sets password_digest to hashed value.
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end

    def is_password?(password)
        #This is_password? is the BCrypt method
        #checks the password and returns boolean.
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end


    def self.find_by_credentials(user_name,password)
        user = User.find_by(user_name: user_name)
        # user = User.find_by({:user_name => user_name})          # does the same thing as line above, line above is just written using Ruby syntactic-sugar
        if user && user.is_password?(password)
            user
        else
            nil
        end
    end



end
