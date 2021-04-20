class TourUser < ApplicationRecord
  belongs_to :tour
  belongs_to :user
  validates_uniqueness_of :user_id, scope: :tour_id, message: "Tour relationship already exists"
end
