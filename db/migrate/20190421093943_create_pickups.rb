class CreatePickups < ActiveRecord::Migration[5.2]
  def change
    create_table :pickups do |t|
      t.integer :cd_id, null: false
      t.string :pickup_title, null: false
      t.text :pickup_body, null: false

      t.timestamps
    end
  end
end
