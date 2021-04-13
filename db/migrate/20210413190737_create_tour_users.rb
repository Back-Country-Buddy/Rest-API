class CreateTourUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :tour_users do |t|
      t.references :tour, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end