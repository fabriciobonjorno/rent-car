class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :model
      t.string :brand
      t.string :board
      t.string :model_year
      t.string :manufacture_year
      t.boolean :reservation

      t.timestamps
    end
  end
end
