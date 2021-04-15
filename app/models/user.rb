class User < ApplicationRecord
  validates_presence_of :user_name,
                        :email_address, 
                        :emergency_contact_name,
                        :emergency_number,
                        :auth
  validates :email_address, uniqueness: true
  
  has_many :tour_users
  has_many :tours, through: :tour_users
  has_many :plans, through: :tours
end
