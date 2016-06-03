class CalendarsController < ApplicationController

  def new
    @calendars = Calendars.new
  end

  def edit
    @calendars = Calendars.find(params[:id])
  end

  def create
    @calendars = Calendars.new
  end
  def index
  end
  def show
  end

end
