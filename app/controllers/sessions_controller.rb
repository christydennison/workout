class SessionsController < ApplicationController
  skip_before_filter :authorize
  def index
    redirect_to calendar_url
  end
  
  def new
  end

  def create
    user = User.find_by_athena(params[:athena])
    Rails.logger.debug "\n *********\n CONTROLLER USER: #{user}\n \
        #{user.inspect}\n *********\n In session controller.\n" 
    Rails.logger.debug "\n *********\n CONTROLLER AUTH.:\ 
        #{user.authenticate(params[:password])}\n \
        #{user.inspect}\n *********\n In session controller.\n" 
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to calendar_url
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
    Rails.logger.debug "\n *********\n SESSION: #{session[:user_id]}\n \
        #{user.inspect}\n *********\n In session controller.\n"
  end

  def destroy
    session[:user_id] = nil
    redirect_to calendars_url, notice: "Logged out"
  end
end
