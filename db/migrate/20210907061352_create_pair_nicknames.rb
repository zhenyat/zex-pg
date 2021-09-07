class CreatePairNicknames < ActiveRecord::Migration[6.1]
  def change
    create_table :pair_nicknames do |t|
      t.references :pair, null: false, foreign_key: true
      t.string     :name

      t.timestamps
    end
    add_index :pair_nicknames, :name, unique: true
  end
end
