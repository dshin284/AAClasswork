class UsersController < ApplicationController

    def new
        @user = User.new
        render :new
    end

    def show
        render :show
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login_user!(@user)
            redirect_to users_url
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    # def activate
    #     @user = User.find_by()
    # end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end

end
