class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorize
  
  attr_reader :current_user

  protected
  def authorize
    @current_user = User.find_by_id(session[:user_id])
    unless @current_user
      redirect_to login_url, notice: "Please log in"
    end
  end
end
