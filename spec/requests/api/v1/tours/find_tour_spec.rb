require 'rails_helper'

RSpec.describe 'Create a tour' do
  before :each do
    user_params = {user_name: 'BercyHamhands', email_address: 'TheHamMan@gmail.com', emergency_contact_name: 'Momma', emergency_number: "10000000"}
    @user = User.create(user_params)
    @tour1 = @user.tours.create!(date: "2021-06-30", location: "the moon", creator_id: @user.id)
    @tour2 = @user.tours.create!(date: "2022-07-05", location: "the sun", creator_id: @user.id)
  end
  it 'can find a tour' do
    get "/api/private/v1/user/#{@user.id}/tour/#{@tour1.id}"

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

  it 'can find all tours from a given user' do
    get "/api/private/v1/user/#{@user.id}/tour"

    expect(response).to be_successful

    tours = JSON.parse(response.body, symbolize_names: true)

    expect(tours).to be_a(Hash)
    expect(tours[:data].count).to eq(2)
    expect(tours[:data][0].keys).to match_array(%i[id type attributes])
    expect(tours[:data][1].keys).to match_array(%i[id type attributes])
    expect(tours[:data][0][:attributes].keys).to match_array(%i[date location creator_id complete])
    expect(tours[:data][1][:attributes].keys).to match_array(%i[date location creator_id complete])

    expect(tours[:data][0][:attributes][:date]).to eq("2021-06-30T00:00:00.000Z")
    expect(tours[:data][0][:attributes][:location]).to eq('the moon')
    expect(tours[:data][0][:attributes][:creator_id]).to eq(@user.id)
    expect(tours[:data][0][:attributes][:complete]).to eq(false)
    expect(tours[:data][1][:attributes][:date]).to eq("2022-07-05T00:00:00.000Z")
    expect(tours[:data][1][:attributes][:location]).to eq('the sun')
    expect(tours[:data][1][:attributes][:creator_id]).to eq(@user.id)
    expect(tours[:data][1][:attributes][:complete]).to eq(false)
  end
end
