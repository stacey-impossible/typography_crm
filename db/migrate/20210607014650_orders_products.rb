# frozen_string_literal: true

class OrdersProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :orders_products do |t|
      t.belongs_to :order
      t.belongs_to :product
    end
  end
end
