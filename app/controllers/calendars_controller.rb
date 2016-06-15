class CalendarsController < ApplicationController
  def new

  end

  def create
    @calendar = Calendar.new.to_a
  end
  #
  # def index
  #   @calendars = Calendar.new.to_a
  # end

  def show
    month = params[:id]
    @calendar = Calendar.new.to_a



    if Time.now.month == 12
      date = Time.now.year.next.to_s + "01"
    else
      date = Time.now.strftime("%Y%m").to_i + 1
    end
  end

  def update

  end
  def month_today
    return month_today
  end
end
