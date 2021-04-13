class CreateTours < ActiveRecord::Migration[5.2]
  def change
    create_table :tours do |t|
      t.datetime :date
      t.string :location
      t.integer :creator_id
      t.boolean :complete, :default => false

      t.timestamps
    end
  end
end
