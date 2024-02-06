class Invitation < ApplicationRecord
  belongs_to :event_invited, class_name: "Event"
  belongs_to :user_invited, class_name: "User"
end
