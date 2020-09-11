require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
    describe "GET #index" do
        context "when user is logged in" do
            before(:each) do
                u = User.create(username:"popcorn",password: "password")
                allow(controller).to receive(:current_user) {u}
            end
            it "renders the goal's index page" do
                get :index
                expect(response).to render_template("index")
            end
        end

        context "when user is not logged in" do
            it "renders the goal's index page" do
                get :index
                expect(response).to redirect_to(new_session_url)
            end
        end


    end
    describe "GET #show" do
        context "when user is logged in." do 
            before(:each) do
                u = User.create(username:"popcorn",password: "password") 
                allow(controller).to receive(:current_user) {u}
            end
            it "renders the goal's show page" do
                u = User.last
                goal = Goal.create(user_id:u.id, body:"Get FANG job.", name:"my software goal")
                get :show, params: {id: goal.id}
                expect(response).to render_template("show")
            end
        end
        context "when user is not logged in." do
            it "redirects to login " do 
                get :show, params: {id: 1}
                expect(response).to redirect_to(new_session_url)
            end            
        end
    end
end
