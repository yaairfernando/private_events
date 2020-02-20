class AddDefaultValueToInvitationsAccepted < ActiveRecord::Migration[6.0]
  def change
    change_column_default :invitations, :accepted, false
  end
end
