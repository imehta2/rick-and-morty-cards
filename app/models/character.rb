# app/models/character.rb
class Character < ApplicationRecord
  has_many :line_items
  has_many :orders, through: :line_items
end