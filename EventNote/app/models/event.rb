class Event < ApplicationRecord

  scope :past_events, -> {where('date < ?', Date.today)}
  scope :future_events, -> {where('date >= ?', Date.today)}

  belongs_to :creator, class_name: "User"
  has_many :attendees, through: :attendee_events, source: :event_attendee
  has_many :attendee_events, foreign_key: :attended_event_id

  has_many :sent_invitations, foreign_key: :event_invited_id, class_name: "Invitation"
  has_many :invitations, through: :invitations, source: :user_invited
end
