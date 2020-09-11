# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  session_token   :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) {User.create(username: "popcorn", password: "123456")}
  describe "User " do
    it {should validate_presence_of(:username) }
    it {should validate_presence_of(:session_token) }
    it {should validate_presence_of(:password_digest) }
    it {should validate_length_of(:password).is_at_least(6)}
    it {should validate_uniqueness_of(:username)}
    it {should validate_uniqueness_of(:session_token)}
    it {should have_many(:goals)}
  end

  describe "User Method" do
    it "should have a # is_password?(password) method" do
      u = User.new(username: "dshin",password: "password")
      expect(u.is_password?("password")).to be(true)
    end
    it "should have #reset_session_token!" do
      u = User.new(username: "dshin",password: "password")
      old_session_token = u.session_token
      u.reset_session_token!
      expect(u.session_token).to_not eq(old_session_token)
    end
    it "should have ::find_by_credentials" do
      u = User.create(username: "dshin",password: "password")
      user1 = User.find_by_credentials("dshin", "password")
      expect(user1.username).to eq("dshin")
    end
    it "should ensure that user has a session token" do
      u = User.create(username: "dshin",password: "password")
      expect(u.session_token).to_not be(nil)
    end
  end
end
