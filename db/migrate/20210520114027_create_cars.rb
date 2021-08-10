class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :series
      t.string :year
      t.string :price
      t.string :probeg
      t.string :motor
      t.string :kpp
      t.string :privod
      t.string :color
      t.text :info
      t.text :stan
      t.string :city
      t.string :telephone

      t.timestamps
    end
  end
end
