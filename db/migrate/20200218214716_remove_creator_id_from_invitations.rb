class RemoveCreatorIdFromInvitations < ActiveRecord::Migration[6.0]
  def change
    remove_column :invitations, :creator_id
  end
end
