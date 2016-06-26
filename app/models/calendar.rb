class Calendar < ActiveRecord::Base
has_many :events
belongs_to :calendars


end
