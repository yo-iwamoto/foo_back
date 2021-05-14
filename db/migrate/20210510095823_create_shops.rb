class CreateShops < ActiveRecord::Migration[6.1]
  def up
    create_table :shops do |t|
      t.string :hotpepper_id, null: false

      t.timestamps
    end
  end
  def down
    drop_table :shops
  end
end
