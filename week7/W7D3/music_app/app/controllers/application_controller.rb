class ApplicationController < ActionController::Base
    # CRLLL:
    # current_user
    # require_logged_in
    # login!
    # logout!
    # logged_in?
    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find_by(session_token: session[:sesion_token])
    end

    def logged_in?
        !!current_user
    end

    def login_user!(user)
        session[:sesion_token] = user.reset_session_token!
    end

    def require_user!
        redirect_to new_session_url if current_user.nil? 
    end

end
