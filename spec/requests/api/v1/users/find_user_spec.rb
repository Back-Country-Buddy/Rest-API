require 'rails_helper'
RSpec.describe 'Users', type: :request do
  
  it 'it returns  users' do
    tim = User.create!(user_name: 'TimtheSkier', email_address: 'noway@gmail.com', emergency_contact_name: 'Mah', emergency_number: "234")
    ian = User.create!(user_name: 'IantheBoarder', email_address: 'yessir@gmail.com', emergency_contact_name: 'Pah', emergency_number: "567")
    
    
    get api_private_v1_user_path(tim.email_address)
    expect(response).to be_successful
    # require 'pry'; binding.pry
    user = JSON.parse(response.body, symbolize_names: true)

    
    expect(user).to be_a(Hash)
    expect(user[:data].first.count).to eq(3)
    expect(user[:data].first.keys).to match_array(%i[id type attributes])
    expect(user[:data].first[:attributes].keys).to match_array(%i[user_name email_address emergency_contact_name emergency_number])
    
    expect(user[:data].first[:attributes][:user_name]).to eq(tim.user_name)
    expect(user[:data].first[:attributes][:email_address]).to eq(tim.email_address)
    expect(user[:data].first[:attributes][:emergency_contact_name]).to eq(tim.emergency_contact_name)
    expect(user[:data].first[:attributes][:emergency_number]).to eq(tim.emergency_number)
  end

  it "returns 404 if user not found" do
  get api_private_v1_user_path("nowerasy@gmailcom")

  expect(response.status).to eq(404)
  end
end
