class Calendar < ActiveRecord::Base
has_many :events
belongs_to :calendars
  def countdays
    @countdays = Event.all.count
  end

  def hours
    @hours = @countdays * 8
  end
end
