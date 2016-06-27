class CalendarsController < ApplicationController
  before_action :require_sign_in, except: [:index, :show]
  before_action :authorize_user, except: [:index, :show]

  def new

  end

  def index

    redirect_to calendar_path(Date.today.strftime('%m-%Y'))
  end

  def create
    @calendar = Calendar.new.to_a
    @calendar_next = Calendar.new(starting_date).to_a
    @calendar_past = Calendar.new(past_date).to_a
  end

  def show
    @date = Date.strptime(params[:id],'%m-%Y')
    @calendar = Calendar.new(@date).to_a
    @calendar_next = (@date + 1.month).strftime('%m-%Y') #Calendar.new(starting_date).to_a
    @calendar_past = (@date - 1.month).strftime('%m-%Y') #Calendar.new(past_date).to_a
    @today = Date.today.strftime('%m-%Y')

    first_day = @calendar.first.first.first
    last_day = @calendar.last.last.first

    @events = Event.where('occurs_on >= ? AND occurs_on <= ?', first_day, last_day)
    @grouped_events = @events.group_by{|e| e.occurs_on.strftime('%Y-%m-%d')}
    # raise @grouped_events.inspect
    @countdays = Event.all.count
    @hours = @countdays * 8
    if Time.now.month == 12
      date = Time.now.year.next.to_s + "01"
    else
      date = Time.now.strftime("%Y%m").to_i + 1
    end
  end

  def update

  end

  def starting_date
    @starting_date = Time.now.months_since(1).to_date
  end

  def past_date
    past_date = Time.now.months_since(-1).to_date
  end

    private
    def calendar_params
      params.require(:calendar).permit(:name, :description, :public)
    end

end
