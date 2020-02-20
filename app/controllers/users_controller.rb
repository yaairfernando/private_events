class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "You have created an account!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @events = []
    @events = User.includes(:attended_events, :events, :invitations).find(params[:id]).previous_events if params[:passed].present?
    @events = User.includes(:attended_events, :events, :invitations).find(params[:id]).upcoming_events if params[:coming].present?
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
