# frozen_string_literal: true

# The ApplicationController class in Ruby is a base class for controllers that provides helper methods
# for managing user authentication and authorization.
class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    return if logged_in?

    flash[:error] = 'You must be logged in to perform that action'
    redirect_to login_path
  end
end
