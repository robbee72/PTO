class Calendar < ActiveRecord::Base
has_many :events

  def month_next
   @month_next = starting_date
  def week

  end

  def day

  end
end
