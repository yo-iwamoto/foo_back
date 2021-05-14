class CreateLikes < ActiveRecord::Migration[6.1]
  def up
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
    add_index :likes, [:user_id, :shop_id], unique: true
  end
  def down
    drop_table :likes
  end
end
