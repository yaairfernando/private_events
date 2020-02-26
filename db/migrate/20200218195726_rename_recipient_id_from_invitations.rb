# frozen_string_literal: true

class RenameRecipientIdFromInvitations < ActiveRecord::Migration[6.0]
  def change
    rename_column :invitations, :recipient_id, :attendee_id
  end
end
