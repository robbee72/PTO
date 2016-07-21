class EventsController < ApplicationController

  # before_action :require_sign_in, except: [:index, :show]
  # before_action :authorize_user, except: [:index, :show]
  def index
    @user = User.find(params[:user_id])
    @events = @user.events

  end

  def new
    @user = User.find(current_user)
    @event = @user.events.new
    if current_user.admin?
      @select_options = [['Scheduled day off','Scheduled day off'],['Requested for PTO', 'Requested for PTO'],['PTO has NOT been approved', 'PTO has NOT been approved'],['PTO approved', 'PTO approved']]
    else #current_user.member?
      @select_options = [['Scheduled day off','Scheduled day off'],['Requested for PTO', 'Requested for PTO']]
    end
  end

  def create
      @user = User.find(params[:user_id])
      @event = @user.events.build(event_params)
      if @event.save
        redirect_to user_calendars_path(@user)
      else
        render :new
      end
  end



  def update
     @event = Event.find(params[:id])
     authorize @event
     if @event.update (event_params)
       redirect_to user_event_path
     else
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
    user = User.find(params[:user_id])
    @event = Event.find(params[:id])
     if @event.destroy
       flash[:notice] = "\"#{@event}\" was deleted successfully."
       redirect_to user_events_path(user.id)
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
