class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :description, null: false
      t.references :user, foreign_key: true
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :burden_id, null: false
      t.integer :region_id, null: false
      t.integer :day_id, null: false
      t.timestamps
    end
  end
end
