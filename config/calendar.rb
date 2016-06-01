
require "active_support/core_ext/date"
require "active_support/core_ext/time"
require "active_support/core_ext/array"


class Calendar
   def intialize(date=Date.today)
     @date = date
   end

   def to_a
     CalendarWeeks.new(@date).to_a.map do |week|
        week.map do |date|
        [date. DayStyles.new(date).to_s]
      end
    end
  end
end

class DayStyles
  def initialize(date)
    @date = date
  end

  def to_s
    [past. today, future, other_month].compact.join(" ")
  end
end

private

  def past
    "past" if @date < Date.today
  end

  def today
    "today" if @date == Date.today
  end

  def future
    "future" if @date > Date.today
  end

  def other_month
       "other_month" if @date.month != Date.today.month
    end
 end
