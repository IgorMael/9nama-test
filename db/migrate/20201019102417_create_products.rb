class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :description
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
    add_index :products, [:description, :price]
  end
end
