class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true

  has_many :event, dependent: :destroy
  has_many :invite, dependent: :destroy
  has_many :invitations, through: :invite, source: :event
  has_many :attendee, dependent: :destroy
  has_many :joined_events, through: :attendee, source: :event
  
end
