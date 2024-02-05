class Event < ApplicationRecord

  belongs_to :creator, class_name: "User"
  has_many :attendees, through: :attendee_events, source: :event_attendee_id
  has_many :attendee_events, foreign_key: :attended_event_id
end
