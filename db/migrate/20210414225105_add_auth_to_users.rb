class AddAuthToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :auth, :string
  end
end
