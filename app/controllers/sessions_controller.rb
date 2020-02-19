class SessionsController < ApplicationController
  # include SessionHelper

  def new
    redirect_to current_user if logged_in?
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user
      log_in @user
      flash[:success] = "Thanks for logging in to the Events site!!"
      redirect_to @user
    else
      flash.now[:danger] = "Check your email!"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:info] = "You have logged out!!"
    redirect_to signup_path
  end
end
