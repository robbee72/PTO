class EventsController < ApplicationController
  def export_events
    @event = Event.find(params[:id])
    @calendar = Icalendar::Calendar.new
      event = Icalendar::Event.new
      event.start = @event.dt_time.strftime("%Y%m%dT%H%M%S")
      event.end = @event.dt_time.strftime("%Y%m%dT%H%M%S")
      event.summary = @event.summary
      event.description = @event.description
      event.location = @event.location
    @calendar.add event
    @calendar.publish
      headers['Content-Type'] = "text/calendar; charset=UTF-8"
      render_without_layout :text => @calendar.to_ical
    end
  end

  def show
  @event = Event.find(params[:id]})

  respond_to do |wants|
    wants.html
    wants.ics do
      calendar = Icalendar::Calendar.new
      calendar.add_event(@event.to_ics)
      calendar.publish
      render :text => calendar.to_ical
    end
  end
  end

end
