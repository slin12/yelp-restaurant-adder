class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :phone
      t.string :city
      t.float :rating

      t.timestamps
    end
  end
end
