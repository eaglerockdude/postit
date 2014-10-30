class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
   protect_from_forgery with: :exception

   helper_method :current_user, :logged_in? , :access_denied

   # if user logged in return user object else nil  "memoizati ||= "
   def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
   end

   def logged_in?
     !!current_user  # !! turns into a boolean ..to preclude nil case
   end

   def require_user
     if !logged_in?
       flash[:error] = "Must be logged in to do that."
       redirect_to root_path
     end
   end

   def require_admin
     access_denied unless logged_in? and current_user.admin?
   end

   def access_denied
     flash[:error] = "Access denied."
     redirect_to root_path
   end

end
