# app/models/character.rb
class Character < ApplicationRecord
  attr_accessor :cart_items_quantity
  has_many :cart_items
  paginates_per 50
  has_many :line_items
  has_many :orders, through: :line_items
end