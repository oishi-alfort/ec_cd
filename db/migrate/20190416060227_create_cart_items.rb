class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :cd_id
      t.integer :quantity, default: 0

      t.timestamps
    end
  end
end
