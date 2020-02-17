class EventsController < ApplicationController
  def index
    @events = Event.all
    @from_events_controller = true
  end

  def new
  end

  def create
  end

  def show

  end


end
