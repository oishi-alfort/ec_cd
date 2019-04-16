class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :cd_id
      t.text :comment_body

      t.timestamps
    end
  end
end
