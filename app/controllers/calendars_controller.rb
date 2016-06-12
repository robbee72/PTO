class CalendarsController < ApplicationController
  def new

  end

  def create
    @calendars = Calendar.new.to_a
  end

  def index
    @calendars = Calendar.new.to_a
  end

  def show
    
  end

  def update

  end
end
