class SessionsController < ApplicationController
  # include SessionHelper

  def view; end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to signup_path
  end
end
