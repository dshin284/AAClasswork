class SessionsController < ApplicationController


    def new 
        #when HTTP makes a request to routes,
        #the routes will look at the sessionsController
        #it will look at the new controller action.
        #method and action are synonymous.
        render :new
        #this references to a cat or cat_rental_request new.html.erb file
        #under the views folder.
    end

    def create
        @user = User.find_by_credentials(
            params[:user][:user_name],
            params[:user][:password]
        )
        if @user
            login!(@user)
            redirect_to cats_url
            # redirect to: cats GET   /cats(.:format)          cats#index
            # how to add the corresponding views???
        else
            render :new
        end
    end
end