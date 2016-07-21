class Calendar < ActiveRecord::Base
has_many :events
has _many :users
belongs_to :user

#scope :available, ->{ where(available:true)}
#scope :unavailable, ->{ where(available: [nil, false])}


    def countdays
      countdays = Event.where(:name => "Requested for PTO").count
    end

    def hours
      hours = countdays * 8
    end

  def approveddays
    approveddays = Event.where(:name => "PTO approved").count
  end

  def approvedhours
    approvedhours = approveddays * 8
  end


end
