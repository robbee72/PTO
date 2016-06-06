class CalendarsController < ApplicationController
  def new

  end

  def index
    @calendars = Calendar
  end
end
