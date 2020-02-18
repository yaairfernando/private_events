class EventsController < ApplicationController
  before_action :find_event, only: %i[show]

  def index
    @events = Event.all
    @from_events_controller = true
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "You have successfuly created a new event!!!"
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def show
  end

  def event_params
    params.require(:event).permit(:location, :date, :time, :description)
  end

  def find_event
    @event = Event.find(params[:id])
  end
end
