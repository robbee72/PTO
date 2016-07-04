class EventsController < ApplicationController

  #before_action :require_sign_in, except: [:index, :show]
  before_action :authorize_user, except: [:index, :show]
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
    @event= Event.find(params[:id])
    @event.assign_attributes(event_params)

     if @event.save
       redirect_to @event
     else
       flash.now[:alert] = "Error saving event. Please try again."
       render :edit
     end
   end

  def show
    @event = Event.new
  end

  def index
  end

  private
  def event_params
    params.require(:event).permit(:name, :occurs_on, :description, :public)
  end

  def authorize_user
    unless current_user.employee?
      flash[:alert] = "You must be an admin to do that."
      redirect_to events_path
    end
  end
end
