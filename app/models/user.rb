class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id
  has_many :invitations, foreign_key: :attendee_id
  has_many :events_invited, through: :invitations, source: :attendee
  
  # has_many :upcoming_events, through: :invitations, source: :event

  
  before_save   :downcase_email

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: {case_sensitive: false}

  # Converts email to all lower-case.
  def downcase_email
    email.downcase!
  end
end
