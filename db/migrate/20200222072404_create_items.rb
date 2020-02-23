class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :listed_price, null: false
      t.string :image_id, null: false
      t.boolean :selling_status, null: false, default: true

      t.timestamps
    end
  end
end
