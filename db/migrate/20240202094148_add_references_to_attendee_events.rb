class AddReferencesToAttendeeEvents < ActiveRecord::Migration[7.0]
  def change
    add_reference :attendee_events, :attendee, null: false, foreign_key: { to_table: :users }
    add_reference :attendee_events, :attended_event, null: false, foreign_key: { to_table: :events }
  end
end
