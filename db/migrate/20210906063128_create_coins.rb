class CreateCoins < ActiveRecord::Migration[6.1]
  def change
    create_table :coins do |t|
      t.string  :name,   null: false
      t.string  :code,   null: false
      t.integer :kind,   null: false, default: 0, limit: 1
      t.integer :status, null: false, default: 0, limit: 1

      t.timestamps
    end
    add_index :coins, :name, unique: true
    add_index :coins, :code, unique: true
  end
end
