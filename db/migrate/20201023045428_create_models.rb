class CreateModels < ActiveRecord::Migration[6.0]
  def change
    create_table :models do |t|
      t.references :manufacturer, null: false, foreign_key: true
      t.string :name, null: false
      t.string :os_version, null: false
      t.integer :year_of_manufacture, null: false
      t.datetime :discarded_at

      t.timestamps
      t.index :discarded_at
      t.index :name, unique: true
    end
  end
end
