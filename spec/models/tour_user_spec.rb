require 'rails_helper'

RSpec.describe TourUser, type: :model do
  describe 'relationships' do
    it {should belong_to :tour}
    it {should belong_to :user}
  end
end