class Event < ActiveRecord::Base
   has_many :calendars, dependent: :destroy
   belongs_to :events
end
