class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :invitations, foreign_key: :event_id
  has_many :attendees, through: :invitations, source: :attendee

  validates :date, presence: true
  validates :location, presence: true
  validates :description, presence: true, length: {minimum:10, maximum:140}
end