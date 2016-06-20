class Event < ActiveRecord::Base
   belongs_to :calendars
   has_many :calendars
   
end
