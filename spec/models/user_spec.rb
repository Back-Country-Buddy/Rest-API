require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :user_name}
    it { should validate_presence_of :email_address}
    it { should validate_presence_of :emergency_contact_name}
    it { should validate_presence_of :emergency_number}
  end

  describe 'relationships' do

    it {should have_many :tour_users}
    it {should have_many(:tours).through(:tour_users)}
    it {should have_many(:plans).through(:tours)}
  end

  describe 'instance methods' do
  end
end