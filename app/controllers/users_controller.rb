# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'You have created an account!'
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @events = []
    @events = User.find(params[:id]).previous_events if params[:passed].present?
    @events = User.find(params[:id]).upcoming_events if params[:coming].present?
  end

  def invited_events
    @invited_events = Event.where(id: Invitation.all.where(attendee_id: current_user.id,
                                                           accepted: false).pluck(:event_id))
    @accepted_button = true
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
