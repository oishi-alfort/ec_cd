class DeletePickUp < ActiveRecord::Migration[5.2]
  def change
  	drop_table :pick_ups
  end
end
