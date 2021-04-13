require 'rails_helper'

RSpec.describe Tour, type: :model do
  describe 'validations' do
    it { should validate_presence_of :date}
    it { should validate_presence_of :location}
    it { should validate_presence_of :creator_id}
    it { should validate_presence_of :complete}
  end

  describe 'relationships' do
    it {should have_many :tour_users}
    it {should have_many :plans}
    it {should have_many(:users).through(:tour_users)}
  end

  describe 'instance methods' do
  end
end