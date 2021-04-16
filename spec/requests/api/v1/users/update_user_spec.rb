require 'rails_helper'
RSpec.describe 'Users', type: :request do
  
  it 'it returns  users' do
    tim = User.create!(user_name: 'TimtheSkier', email_address: 'noway@gmail.com', emergency_contact_name: 'Mah', emergency_number: "234", auth: "xx2032432")
    ian = User.create!(user_name: 'IantheBoarder', email_address: 'yessir@gmail.com', emergency_contact_name: 'Pah', emergency_number: "567", auth: "x5552")
    
    user_params = {user_name: 'TimtheSkier', email_address: 'noway@gmail.com', emergency_contact_name: 'daddy', emergency_number: "234", auth: "xx2032432"}
    
    patch api_private_v1_user_path(tim.id), params: user_params
    
    expect(response).to be_successful
    user = JSON.parse(response.body, symbolize_names: true)
    
    expect(user).to be_a(Hash)
    expect(user[:data].count).to eq(3)
    expect(user[:data].keys).to match_array(%i[id type attributes])
    expect(user[:data][:attributes].keys).to match_array(%i[user_name email_address emergency_contact_name emergency_number auth])
    
    expect(user[:data][:attributes][:user_name]).to eq(tim.user_name)
    expect(user[:data][:attributes][:email_address]).to eq(tim.email_address)
    expect(user[:data][:attributes][:emergency_contact_name]).to eq('daddy')
    expect(user[:data][:attributes][:emergency_number]).to eq(tim.emergency_number)
    expect(user[:data][:attributes][:auth]).to eq(tim.auth)
  end

  it "returns 404 if user not found" do
  patch api_private_v1_user_path(99999)

  expect(response.status).to eq(404)
  end
end