require 'rails_helper'

RSpec.describe Goal, type: :model do
  describe "user goal validations" do 
    it {should validate_presence_of(:user_id) }
    it {should validate_presence_of(:body) }
    it {should belong_to(:user) }
    
  end

end
