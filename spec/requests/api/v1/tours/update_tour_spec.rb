require 'rails_helper'

RSpec.describe 'Update a tour' do
  before :each do
    tour_params = { date: "2021-06-30", location: "the moon", creator_id: 50}
    @tour = Tour.create(tour_params)
  end

  it 'can update a tour' do
    patch "/api/private/v1/tour/#{@tour.id}?location=deathstar&complete=true"

    expect(response).to be_successful

    tour = JSON.parse(response.body, symbolize_names: true)

    expect(tour[:data][:attributes][:date]).to eq("2021-06-30T00:00:00.000Z")
    expect(tour[:data][:attributes][:location]).to_not eq('the moon')
    expect(tour[:data][:attributes][:location]).to eq('deathstar')
    expect(tour[:data][:attributes][:creator_id]).to eq(50)
    expect(tour[:data][:attributes][:complete]).to eq(true)
  end
end
