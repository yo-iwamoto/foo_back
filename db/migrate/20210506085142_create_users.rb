class CreateUsers < ActiveRecord::Migration[6.1]
  def up
    create_table :users do |t|
      t.string :uid, null: false
      t.string :name, null: false

      t.timestamps
    end
    add_index :users, :uid, unique: true
  end

  def down 
    drop_table :users
  end
end
