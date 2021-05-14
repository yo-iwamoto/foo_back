class CreateReports < ActiveRecord::Migration[6.1]
  def up
    create_table :reports do |t|
      t.references :user, null: false, foreign_key: true
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
    add_index :reports, [:user_id, :shop_id], unique: true
  end
  def down
    drop_table :reports
  end
end
