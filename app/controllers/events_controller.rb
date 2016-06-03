class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      render :new
      #redirect_to calendar_index_path
    else
      render :new
    end
  end

  def index
    @event = Event.new
  end

  def show
  end

  private

  def event_params
    params.require(:event).permit(:name, :ocurrs_on)
  end
end
