require 'rails_helper'
RSpec.describe 'Users', type: :request do
  
  it 'it returns all users' do
    users = User.create([{user_name: 'TimtheSkier', email_address: 'noway@gmail.com', emergency_contact_name: 'Mah', emergency_number: "234"},{user_name: 'IantheBoarder', email_address: 'yessir@gmail.com', emergency_contact_name: 'Pah', emergency_number: "567"}])
    
    get api_private_v1_user_index_path
    expect(response).to be_successful
    
    users = JSON.parse(response.body, symbolize_names: true)
    
    expect(users).to be_a(Hash)
    expect(users[:data].count).to eq(2)
    users[:data].each do |user|
      expect(user).to be_a(Hash)
      expect(user.keys).to match_array(%i[id type attributes])
      expect(user[:attributes].keys).to match_array(%i[user_name email_address emergency_contact_name emergency_number])
    end
  end
end
