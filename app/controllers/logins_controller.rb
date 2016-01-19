class LoginsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "You are logged in."
      redirect_to posts_path
    else
      flash[:danger] = "Invalid login."
      redirect_to login_path
    end
  end
  
  def distroy
    session[:user_id] = nil
    flash[:success] = "You have logged out."
    redirect_to root_path
  end
  
end