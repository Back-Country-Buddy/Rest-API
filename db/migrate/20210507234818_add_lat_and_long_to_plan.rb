class AddLatAndLongToPlan < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :lat, :string
    add_column :plans, :long, :string
  end
end
