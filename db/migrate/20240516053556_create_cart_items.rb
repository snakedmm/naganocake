class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|

      t.timestamps
      t.integer :item_id, null: false
      t.integer :costomer_id, null: false
      t.integer :amount, null: false


    end
  end
end
