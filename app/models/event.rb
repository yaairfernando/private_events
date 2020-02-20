class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :invitations, foreign_key: :event_id
  has_many :attendees, through: :invitations, source: :attendee

  validates :date, presence: true,  date: { after_or_equal_to: Proc.new { DateTime.now }, allow_blank: false, message: " of the event must be after today" }
  validates :location, presence: true
  validates :name, presence: true
  validates :description, presence: true, length: {minimum:10, maximum:340}
end

