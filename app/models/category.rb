# app/models/category.rb
class Category < ApplicationRecord
  has_many :character_categories
  has_many :characters, through: :character_categories
end