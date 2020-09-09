class UsersController < ApplicationController 

    def index
        render plain: "I'm in the index action!"
        # render json: users
    end

    def create
        render json: params
    end 

    def show
        # user = User.find(params[:id])
        render json: params
    end

end