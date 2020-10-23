class CreateInventories < ActiveRecord::Migration[6.0]
  def change
    create_table :inventories do |t|
      t.references :phone, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :quantity, null: false
      t.text :note
      t.datetime :discarded_at

      t.timestamps
      t.index :discarded_at
    end
  end
end
