# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :invitations, foreign_key: :event_id, dependent: :destroy
  has_many :attendees, through: :invitations, source: :attendee
  has_one_attached :image

  validates :date, presence: true
  validates :location, presence: true
  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 340 }

  scope :upcoming, -> { where('date >= ?', DateTime.now) }
  scope :past, -> { where('date < ?', DateTime.now) }
end
