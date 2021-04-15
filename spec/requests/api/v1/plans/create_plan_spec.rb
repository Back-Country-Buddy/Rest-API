require 'rails_helper'

RSpec.describe 'Create a plan' do
  it 'creates a new plan' do
    user_params = {user_name: 'TimtheSkier', email_address: 'noway@gmail.com', emergency_contact_name: 'Mah', emergency_number: "234"}
    @user = User.create(user_params)
    tour_params = { date: "2021-06-30", location: "the moon", creator_id: @user.id }
    @tour = @user.tours.create!(tour_params)

    plan_params = { hazard_weather: "string", hazard_avalanche: "another one", hazard_summary: "boom, anotha one", route_preview: "route preview string", route_alternative: "alternative route", emergency_plan: "in case of emergency", debrief_conditions: "here is the debrief", debrief_decisions: "this is what we decided", debrief_plan: "this is the debrief plan" }

    post api_v1_user_tour_plan_index_path(params: plan_params, user_id: @user.id, tour_id: @tour.id)

    expect(response).to be_successful

    plan = JSON.parse(response.body, symbolize_names: true)

    expect(plan).to be_a(Hash)
    expect(plan[:data].count).to eq(3)
    expect(plan[:data].keys).to match_array(%i[id type attributes])
    expect(plan[:data][:attributes].keys).to match_array(%i[hazard_weather hazard_avalanche hazard_summary route_preview route_alternative emergency_plan debrief_conditions debrief_decisions debrief_plan])

    expect(plan[:data][:attributes][:hazard_weather]).to eq("string")
    expect(plan[:data][:attributes][:hazard_avalanche]).to eq('another one')
    expect(plan[:data][:attributes][:hazard_summary]).to eq("boom, anotha one")
    expect(plan[:data][:attributes][:route_preview]).to eq("route preview string")
    expect(plan[:data][:attributes][:route_alternative]).to eq("alternative route")
    expect(plan[:data][:attributes][:emergency_plan]).to eq("in case of emergency")
    expect(plan[:data][:attributes][:debrief_conditions]).to eq("here is the debrief")
    expect(plan[:data][:attributes][:debrief_decisions]).to eq("this is what we decided")
    expect(plan[:data][:attributes][:debrief_plan]).to eq("this is the debrief plan")
  end
end
