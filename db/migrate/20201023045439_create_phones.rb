class CreatePhones < ActiveRecord::Migration[6.0]
  def change
    create_table :phones do |t|
      t.string :body_color, null: false
      t.integer :data_memory, null: false
      t.decimal :price, null: false
      t.references :model, null: false, foreign_key: true
      t.datetime :discarded_at

      t.timestamps
      t.index :discarded_at
    end
  end
end
