class Tour < ApplicationRecord
  validates_presence_of :date,
                        :location,
                        :creator_id

  has_many :tour_users, dependent: :destroy
  has_many :plans, dependent: :destroy
  has_many :users, through: :tour_users
end
