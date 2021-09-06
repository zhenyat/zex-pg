class CreateCoinNicknames < ActiveRecord::Migration[6.1]
  def change
    create_table :coin_nicknames do |t|
      t.references :coin, null: false, foreign_key: true
      t.string     :name, null: false

      t.timestamps
    end
    add_index :coin_nicknames, :name, unique: true
  end
end
