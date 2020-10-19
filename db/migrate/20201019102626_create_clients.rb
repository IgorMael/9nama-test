class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name

      t.timestamps
    end
    add_index :clients, :name
  end
end
