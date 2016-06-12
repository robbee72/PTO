class EventsController < ApplicationController
before_filter :fix_params, :only => [:create, :update]
  def new
    @event = Event.new
  end

  def create
  @event = Event.new(params[:event])

  respond_to do |format|
    if @event.save
      format.html {redirect_to calendars_path, notice: 'Calendar was successfully created.' }
    else
      format.html { render action: "calendars_path" }
    end
  end
end

  def index

  end

  def show

  end

  

  private

  def event_params
    params.require(:event).permit(:name, :ocurrs_on)
  end

end
