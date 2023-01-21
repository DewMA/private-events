class Event < ApplicationRecord
  belongs_to :user

  validates :title, :body, :location, :starts_at, presence: true
  has_many :invite, dependent: :destroy
  has_many :invited, through: :invite, source: :user
  has_many :attendee, dependent: :destroy
  has_many :attenders, through: :attendee, source: :user

  scope :upcoming, -> { where("starts_at > ?", Date.current) }
  scope :past, -> { where("starts_at < ?", Date.current) }

end
