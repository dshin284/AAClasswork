require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe "GET #new" do
        it "renders the new template" do
            get :new,{}
            expect(response).to render_template("new")
        end 
    end

    describe "GET #show" do
        it "renders the show template" do
            user = User.create(username: "monkey", password: "password")
            get :show, params: {id: user.id}
            expect(response).to render_template("show")
        end
    end

    describe "POST #create" do
        context "with invalid params" do
            it "validates user password and username " do
                post :create,params:{user:{username:"dxu"}}
                expect(response).to render_template("new")
                expect(flash[:errors]).to be_present
            end
            it "validates that the password is at least 6 characters long" do 
                post :create, params:{user:{username:"dxu",password:"123"}}
                expect(response).to render_template("new")
                expect(flash[:errors]).to be_present
            end
        end

        context "with valid params" do 
            it "it redirects user to the user's page " do
                post :create, params: {user: {username: 'dxu', password: 'password'}}
                expect(response).to redirect_to(user_url(User.last))
            end
        end
    end
end
