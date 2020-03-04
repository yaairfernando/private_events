# frozen_string_literal: true

class SessionsController < ApplicationController
  # include SessionHelper

  def new
    redirect_to current_user if logged_in?
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user
      log_in @user
      flash[:success] = 'Welcome back to your Private Events!!!'
      redirect_to @user
    else
      flash.now[:danger] = 'Check your email!'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:info] = 'Log in to create new events!!'
    redirect_to login_path
  end
end
