class Plan < ApplicationRecord
  validates_presence_of :hazard_weather,
                        :hazard_avalanche,
                        :hazard_summary,
                        :route_preview,
                        :route_alternative,
                        :emergency_plan,
                        :debrief_conditions,
                        :debrief_decisions,
                        :debrief_plan
  belongs_to :tour
end
