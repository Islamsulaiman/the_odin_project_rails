class RenameAttendeeIdAndAttendeeEventIdInAttendeeEvents < ActiveRecord::Migration[7.0]
  def change
    rename_column :attendee_events, :attendee_id, :event_attendee_id
  end
end
