# frozen_string_literal: true

class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id
  has_many :invitations, foreign_key: :attendee_id
  has_many :invited_events, through: :invitations, source: :event
  has_many :attended_events, through: :invitations, source: :event

  before_save :downcase_email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  # Converts email to all lower-case.
  def downcase_email
    email.downcase!
  end

  def upcoming_events
    attended_events.where('date >= ? AND accepted = ?', DateTime.now, true)
  end

  def previous_events
    attended_events.where('date < ? AND accepted = ?', DateTime.now, true)
  end
end
