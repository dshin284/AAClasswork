# == Schema Information
#
# Table name: users
#
#  id            :bigint           not null, primary key
#  username      :string           not null
#  password      :string           not null
#  status        :boolean          not null
#  reddit_id     :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  session_token :string           not null
#
class User < ApplicationRecord

    validates :username, :session_token, presence: true, uniqueness: true
    validates :password, length: {minimum: 6, allow_nil:true}
    

    attr_reader :password
    after_initialize :ensure_session_token


    #SPIRE

    def self.find_by_crendeials(username, password)
        user = User.find_by(username: username)
        return nil if user.nil?
        return user.is_password?(password)? user: n
    end

    def password=(password)
        #hashing password
        @password = password
        self.password_digest = BCryt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end


    def reset_session_token!
        self.session_token = SecureRandom.base64(64) 
        self.save!
        self.session_token
    end


    def ensure_session_token
        self.session_token ||= SecureRandom.base64(64)
    end
    

end
