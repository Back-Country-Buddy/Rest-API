class Api::Private::V1::PlanController < ApplicationController
  def index
    plan = Plan.where(tour_id: :tour_id)
    begin
      render json: PlanSerializer.new(plan)
    rescue
      render json: {"error" => {}}, status: 404
    end
  end

  def show
    begin
      render json: PlanSerializer.new(Plan.find(params[:id]))
    rescue
      render json: {"error" => {}}, status: 404
    end
  end

  def update
    begin
      plan = Plan.find(params[:id])
      plan.update!(plan_params)
      render json: PlanSerializer.new(plan), status:202
    rescue
      render json: {"error" => {}}, status: 404
    end
  end

  def create
    tour = Tour.find(params[:tour_id])
    plan = tour.plans.create!(plan_params)
    begin
      render json: PlanSerializer.new(plan)
    rescue
      render json: {"error" => {}}, status: 404
    end
  end

  private
  def plan_params
    params.permit(:hazard_weather, :hazard_avalanche, :hazard_summary, :route_preview, :route_alternative, :emergency_plan, :debrief_conditions, :debrief_decisions, :debrief_plan)
  end
end
