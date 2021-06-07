class OrdersProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :orders_products do |t|
      t.belongs_to :orders
      t.belongs_to :products
    end
  end
end
