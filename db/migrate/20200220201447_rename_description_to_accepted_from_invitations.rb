# frozen_string_literal: true

class RenameDescriptionToAcceptedFromInvitations < ActiveRecord::Migration[6.0]
  def change
    rename_column :invitations, :description, :accepted
    change_column :invitations, :accepted, :boolean
  end
end
