class Event < ActiveRecord::Base

attr_accessor :day, :schedule_day_off

require 'date' # Makes Ruby's date library available to our code


    def initialize (day, schedule_day_off)
      @day, @schedule_day_off = day, schedule_day_off
    end

    def Calendar.new(starting_date).to_a

    end

    def selectable2

    end

    def schedule_day_off

    end
    # def @hours
    #   @hours = 8*(last_date - first_date + schedule_day_off)
    # end


end
