# frozen_string_literal: true

class AddFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :phone, :string
    add_column :users, :type, :string
  end
end
