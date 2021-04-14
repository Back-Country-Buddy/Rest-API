require 'rails_helper'

RSpec.describe 'Create a user' do
  it 'creates a new user' do

    user_params = {user_name: 'TimtheSkier', email_address: 'noway@gmail.com', emergency_contact_name: 'daddy', emergency_number: "234"}

    post api_v1_user_index_path(user_params)
    expect(response).to be_successful
  
    user = JSON.parse(response.body, symbolize_names: true)

    expect(user).to be_a(Hash)
    expect(user[:data].count).to eq(3)
    expect(user[:data].keys).to match_array(%i[id type attributes])
    expect(user[:data][:attributes].keys).to match_array(%i[user_name email_address emergency_contact_name emergency_number])
    
    expect(user[:data][:attributes][:user_name]).to eq('TimtheSkier')
    expect(user[:data][:attributes][:email_address]).to eq('noway@gmail.com')
    expect(user[:data][:attributes][:emergency_contact_name]).to eq('daddy')
    expect(user[:data][:attributes][:emergency_number]).to eq("234")
  end
end