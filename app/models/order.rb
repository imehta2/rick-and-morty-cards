# app/models/order.rb
class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items
  has_many :characters, through: :line_items
end