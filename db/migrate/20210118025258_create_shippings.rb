class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string :postal,           null: false
      t.integer :shipping_erea_id,        null: false
      t.string :adress,                   null: false
      t.string :adress_number,            null: false
      t.string :adress_building         
      t.string :telphone_number,             null: false
      t.references :purchase,             foreign_key: true

      t.timestamps
    end
  end
end