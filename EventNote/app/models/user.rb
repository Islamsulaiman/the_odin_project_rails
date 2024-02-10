class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :created_events, foreign_key: :creator_id, class_name: "Event"
  has_many :attendee_events, foreign_key: :event_attendee_id
  has_many :attended_events, through: :attendee_events, source: :attended_event

  has_many :invitations, foreign_key: :user_invited_id
  has_many :created_event_invitations, through: :invitations, source: :event_invited
end
