class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :end_user_id, null: false
      t.string :postal_code, null: false
      t.string :ship_to, null: false
      t.string :consignee, null: false

      t.timestamps
    end
  end
end
