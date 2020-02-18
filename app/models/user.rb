class User < ApplicationRecord
  has_many :invitations, foreign_key: :creator_id
  has_many :events, through: :invitations, source: :creator
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
