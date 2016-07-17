class EventsController < ApplicationController

  # before_action :require_sign_in, except: [:index, :show]
  # before_action :authorize_user, except: [:index, :show]
  def index
    @events = Event.all

  end

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


  def update
     @event = Event.find(params[:id])

     if @event.save
       flash[:notice] = "Event was updated successfully."
       redirect_to @event
     else
       flash.now[:alert] = "There was an error saving the event. Please try again."
       render :edit
     end
   end

  def show
    @event = Event.all
  end

  def edit
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])

     if @event.delete
     flash[:notice] = "\"#{@event}\" was deleted successfully."
     redirect_to events_path
     else
       flash.now[:alert] = "There was an error deleting the event."
       render :show
     end
  end


  private
  def event_params
    params.require(:event).permit(:name, :occurs_on, :description, :public)
  end



end
