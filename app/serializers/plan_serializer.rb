class PlanSerializer
  include JSONAPI::Serializer
  attributes :hazard_weather,
             :hazard_avalanche,
             :hazard_summary,
             :route_preview,
             :route_alternative,
             :emergency_plan,
             :checklist,
             :departure_check,
             :debrief_conditions,
             :debrief_decisions,
             :debrief_plan
end
