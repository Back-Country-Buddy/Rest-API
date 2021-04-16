require 'rails_helper'

RSpec.describe 'delete an item' do
  it 'deletes an item and returns a 204 with no body' do
    tim = User.create!(user_name: 'TimtheSkier', email_address: 'noway@gmail.com', emergency_contact_name: 'Mah', emergency_number: "234", auth: "xx2032432")
    ian = User.create!(user_name: 'IantheBoarder', email_address: 'yessir@gmail.com', emergency_contact_name: 'Pah', emergency_number: "567", auth: "x23423432")
    id = tim.id

    expect{ delete "/api/private/v1/user/#{id}" }.to change(User, :count).by(-1)

    expect(response).to be_successful
    expect(response.status).to eq(204)
    expect(response.body).to be_empty
    expect{ User.find(id) }.to raise_error(ActiveRecord::RecordNotFound)
  end
end