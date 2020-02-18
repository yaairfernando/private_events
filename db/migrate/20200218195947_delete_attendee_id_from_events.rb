class DeleteAttendeeIdFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :attendee_id
  end
end
