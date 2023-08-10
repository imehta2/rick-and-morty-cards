# app/models/character.rb
class Character < ApplicationRecord
  attr_accessor :cart_items_quantity
  has_many :cart_items
  paginates_per 50
  has_many :line_items
  has_many :orders, through: :line_items
  belongs_to :category

    # Validation rules
    validates :name, presence: true
    validates :status, presence: true
    validates :gender, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :image, presence: true, allow_blank: true

  # Define the ransackable_attributes method to allowlist searchable attributes
  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "gender", "id", "image", "location", "name", "origin", "price", "species", "status", "updated_at"]
  end
# Define the ransackable_associations method to allowlist searchable associations
def self.ransackable_associations(auth_object = nil)
  ["cart_items", "category", "line_items", "orders"]
end

end
