class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name,          null: false
      t.text :item_description,     null: false
      t.integer :category_id,       null: false, default: 0
      t.integer :condition_id,      null: false, default: 0
      t.integer :shipping_cost_id,  null: false, default: 0
      t.integer :prefecture_id,     null: false, default: 0
      t.integer :days_to_ship_id,   null: false, default: 0
      t.integer :price,             null: false
      t.references :user,           null: false, foreign_key: true
      t.timestamps
    end
  end
end

