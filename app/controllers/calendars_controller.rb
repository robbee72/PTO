class CalendarsController < ApplicationController
  def new

  end

  def index
    @calendars = Calendar.new.to_a
  end
end
