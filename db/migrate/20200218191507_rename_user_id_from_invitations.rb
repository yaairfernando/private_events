# frozen_string_literal: true

class RenameUserIdFromInvitations < ActiveRecord::Migration[6.0]
  def change
    rename_column :invitations, :user_id, :creator_id
  end
end
