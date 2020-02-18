class EventsController < ApplicationController
  include SessionsHelper
  
  def index
    @events = Event.all
    @from_events_controller = true
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    byebug
    if event.save
      flash[:success] = "You have successfuly created a new event!!!"
      redirect_to @event
    else
      render :new
    end
  end

  def show

  end

  def event_params
    params.require(:event).permit(:location, :date, :time, :description)
  end


end
