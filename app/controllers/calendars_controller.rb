class CalendarsController < ApplicationController
  def new

  end

  def create
    @calendar = Calendar.new.to_a
    @calendar_next = Calendar.new(starting_date).to_a
    @calendar_past = Calendar.new(past_date).to_a
  end

  def show

    @calendar = Calendar.new.to_a
    @calendar_next = Calendar.new(starting_date).to_a
    @calendar_past = Calendar.new(past_date).to_a


    if Time.now.month == 12
      date = Time.now.year.next.to_s + "01"
    else
      date = Time.now.strftime("%Y%m").to_i + 1
    end
  end

  def update

  end

  def starting_date
    @starting_date = Time.now.months_since(1).to_date
  end

  def past_date
    past_date = Time.now.months_since(-1).to_date
  end

end
