require 'rails_helper'

RSpec.describe 'Create a tour' do
  before :each do
    @user1 = User.create(user_name: 'fake_user', email_address: 'fakefake@fake.com', emergency_contact_name: 'Mah', emergency_number: "234")
    @user2 = User.create(user_name: 'not_a_user', email_address: 'nope@nope.nope', emergency_contact_name: 'Moop', emergency_number: "567")

    @tour1 = @user1.tours.create!(date: "2021-06-30", location: "the moon", creator_id: @user1.id)
  end

  # it 'creates a new tour_user' do
  #   expect(@tour1.users).to eq([@user1])
  #
  #   TourUser.create!(tour: @tour1, user:@user2)
  #
  #   expect(@tour1.users).to eq([@user1, @user2])
  # end

  it 'returns an error if you try to create a duplicate tour_user' do
    post "/api/private/v1/tour_user?email_address=nope@nope.nope&tour_id=#{@tour1.id}"

    expect(response).to be_successful

    expect{post "/api/private/v1/tour_user?email_address=nope@nope.nope&tour_id=#{@tour1.id}"}.to raise_error(ActiveRecord::RecordInvalid)
  end
end
