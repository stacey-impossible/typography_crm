# frozen_string_literal: true

class Product < ApplicationRecord
  has_and_belongs_to_many :orders

  validates :title, :price, presence: true
end
