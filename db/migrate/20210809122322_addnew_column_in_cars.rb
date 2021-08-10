class AddnewColumnInCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :user_id, :integer
  end
end
