class Calendar < ActiveRecord::Base
has_many :events
belongs_to :calendars


  def for_date
    @for_dates = For_date.all 
  end
end
