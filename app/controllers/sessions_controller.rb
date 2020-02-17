class SessionsController < ApplicationController
  def view; end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user
      log_in @user
    else
      render 'new'
    end
  end

  def destroy
  end
end
