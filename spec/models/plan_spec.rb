require 'rails_helper'

RSpec.describe Plan, type: :model do
  describe 'validations' do
    it { should validate_presence_of :hazard_weather}
    it { should validate_presence_of :hazard_avalanche}
    it { should validate_presence_of :hazard_summary}
    it { should validate_presence_of :route_preview}
    it { should validate_presence_of :route_alternative}
    it { should validate_presence_of :emergency_plan}
    it { should validate_presence_of :debrief_conditions}
    it { should validate_presence_of :debrief_decisions}
    it { should validate_presence_of :debrief_plan}
  end

  describe 'relationships' do
    it {should belong_to :tour}
  end

  describe 'instance methods' do
  end
end