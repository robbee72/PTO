class Event < ActiveRecord::Base

attr_accessor :day, :schedule_day_off

require 'date' # Makes Ruby's date library available to our code


    def initialize (day, schedule_day_off)
      @day, @schedule_day_off = day, schedule_day_off
    end


    def from

    end

    def to

    end
    def schedule_day_off

    end

    # def @hours
    #   @hours = 8*(last_date - first_date + schedule_day_off)
    # end


end
