class Event < ApplicationRecord

  belongs_to :creator, class_name: "User"
  has_many :attendees, thought: :attended_events, source: :event_attendee_id
end
