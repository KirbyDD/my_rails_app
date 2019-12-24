class UsersController < ApplicationController
  def new
  end

  def create
    user = User.create(user_params)
    if user.save
      flash[:success] = "Account Created!"
      session[:user_id] = user.id
      redirect_to "/"
    else
      flash[:notice] = "Account not created."
      render :new
    end
  end

  private

    def user_params
      params.permit(:email, :username, :password, :password_confirmation)
    end
end
