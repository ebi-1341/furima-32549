class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postcode, null: false
      t.integer :region_id, null: false
      t.string :city_name, null: false
      t.string :house_number, null: false
      t.string :building
      t.string :phone_number, null: false
      t.references :purchase, foreign_key: true
      t.timestamps
    end
  end
end
