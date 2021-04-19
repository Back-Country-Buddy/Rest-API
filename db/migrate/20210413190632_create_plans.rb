class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.string :hazard_weather, :default => "nil"
      t.string :hazard_avalanche, :default => "nil"
      t.string :hazard_summary, :default => "nil"
      t.string :route_preview, :default => "nil"
      t.string :route_alternative, :default => "nil"
      t.string :emergency_plan, :default => "nil"
      t.boolean :checklist, :default => false
      t.boolean :departure_check, :default => false
      t.string :debrief_conditions, :default => "nil"
      t.string :debrief_decisions, :default => "nil"
      t.string :debrief_plan, :default => "nil"
      t.references :tour, foreign_key: true

      t.timestamps
    end
  end
end
