class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        #self.find_by_credentials was defined in user model
        @user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
        )

        if @user
            login_user!(@user)
            redirect_to user_url
        else
            flash.now[:errors] = ["incorrect email or password"]
            render :new
        end
    end

    def destroy
        current_user.reset_session_token!
        session[:session_token] = nil

        redirect_to new_session_url
    end

end
