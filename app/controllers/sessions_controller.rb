class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      error = Error.new
      flash[:notice] = error.bad_credentials
      redirect_to "/login"
    end
  end

  def destroy
    session.delete(:user_id)
  end

end
