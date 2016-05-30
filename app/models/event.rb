class Event < ActiveRecord::Base

  def to_ics
    event = Icalendar::Event.new
    event.start = self.date.strftime("%Y%m%dT%H%M%S")
    event.end = self.end_date.strftime("%Y%m%dT%H%M%S")
    event.summary = self.title
    event.description = self.summary
    event.location = 'Here !'
    event.klass = "PUBLIC"
    event.created = self.created_at
    event.last_modified = self.updated_at
    event.uid = event.url = "#{PUBLIC_URL}events/#{self.id}"
    event.add_comment("AF83 - Shake your digital, we do WowWare")
    event
  end

  def title
    true
  end
