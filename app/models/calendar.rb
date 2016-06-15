class Calendar < ActiveRecord::Base
has_many :events

  def month_next
   @month_next = starting_date
  def week
  end



  # def from
  #   @from = Date.today + selectable1
  # end
  #
  # def to
  #   @to = Date.today + selectable2
  # end
end
