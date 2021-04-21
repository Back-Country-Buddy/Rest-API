require 'rails_helper'

RSpec.describe 'Delete a tour' do
  it 'creates a new tour' do
    @tour = Tour.create!(date: "2021-06-30", location: "the moon", creator_id: 100)
    id = @tour.id

    expect{ delete "/api/private/v1/tour/#{id}" }.to change(Tour, :count).by(-1)

    expect(response).to be_successful
    expect(response.status).to eq(204)
    expect(response.body).to be_empty
    expect{ Tour.find(id) }.to raise_error(ActiveRecord::RecordNotFound)
  end
end
