# app/models/character.rb
class Character < ApplicationRecord
  attr_accessor :cart_items_quantity
  has_many :cart_items
  paginates_per 50
  has_many :line_items
  has_many :orders, through: :line_items
  belongs_to :category

  # Define the ransackable_attributes method to allowlist searchable attributes
  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "gender", "id", "image", "location", "name", "origin", "price", "species", "status", "updated_at"]
  end
# Define the ransackable_associations method to allowlist searchable associations
def self.ransackable_associations(auth_object = nil)
  ["cart_items", "category", "line_items", "orders"]
end

end
