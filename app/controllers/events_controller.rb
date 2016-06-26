class EventsController < ApplicationController
  
  def new
    @event = Event.new
  end

  def create
      @event = Event.new(event_params)
      if @event.save
        redirect_to '/calendars'
      else
        render :new
      end
  end

  def show
    @event = Event.new
  end
  def index
  end



  private
  def event_params
    params.require(:event).permit(:name, :occurs_on)
  end
end
