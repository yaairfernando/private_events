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
      puts "+++++++++++++++++++++++++"
      puts @event&.errors.full_messages
      puts current_user.id
      puts "+++++++++++++++++++++++++"
      render :new
    end
  end

  def attend
    @event = Event.find_by(id: params[:id])
    @invitation = Invitation.new(attendee_id: current_user.id, event_id: params[:id])

    if @invitation.save
      flash[:success] = "You have successfuly attended the event!!!"
      byebug
      redirect_to current_user
    else
      render event_path(@event)
    end
  end

  def show
  end

  def event_params
    params.require(:event).permit(:location, :date, :description)
  end

  def find_event
    @event = Event.find(params[:id])
  end
end
