class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorize
  Rails.logger.debug "\n *********\n In application controller.\n *********\n"

  attr_reader :current_user

  protected
  def authorize
    @current_user = User.find_by_id(session[:user_id])
    Rails.logger.debug "\n *********\n CURRENT USER: #{current_user.inspect}\
        \n#{current_user}\n *********\nIn application controller.\n"
    unless @current_user
      redirect_to login_url, notice: "Please log in"
    end
  end
end
