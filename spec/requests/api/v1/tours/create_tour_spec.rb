require 'rails_helper'

RSpec.describe 'Create a tour' do
  it 'creates a new tour' do
    user_params = {user_name: 'TimtheSkier', email_address: 'noway@gmail.com', emergency_contact_name: 'Mah', emergency_number: "234"}

    @user = User.create(user_params)

    tour_params = { date: "2021-06-30", location: "the moon", creator_id: @user.id }

    post api_v1_user_tour_index_path(params: tour_params, user_id: @user.id)

    expect(response).to be_successful

    tour = JSON.parse(response.body, symbolize_names: true)

    expect(tour).to be_a(Hash)
    expect(tour[:data].count).to eq(3)
    expect(tour[:data].keys).to match_array(%i[id type attributes])
    expect(tour[:data][:attributes].keys).to match_array(%i[date location creator_id complete])

    expect(tour[:data][:attributes][:date]).to eq("2021-06-30T00:00:00.000Z")
    expect(tour[:data][:attributes][:location]).to eq('the moon')
    expect(tour[:data][:attributes][:creator_id]).to eq(@user.id)
    expect(tour[:data][:attributes][:complete]).to eq(false)
  end
end
