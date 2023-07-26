# app/models/character.rb
class Character < ApplicationRecord
  paginates_per 50
  has_many :line_items
  has_many :orders, through: :line_items
end