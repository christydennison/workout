class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorize
  before_filter :set_timezone
  attr_reader :current_user

  protected
  def authorize
    Rails.logger.debug "\n *********\n In authorize in app. cont.\n *********\n"
    @current_user = User.find_by_id(session[:user_id])
    Rails.logger.debug "\n *********\n CURRENT USER: #{@current_user.inspect}\
        \n#{@current_user}\n *********\nIn application controller.\n"
    unless @current_user
      redirect_to login_url, notice: "Please log in"
    end
  end
  
  def set_timezone
    Time.zone = 'EST'
  end
  
end
