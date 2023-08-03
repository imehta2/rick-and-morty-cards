# app/models/line_item.rb
class LineItem < ApplicationRecord
  belongs_to :character
  belongs_to :order

# Define the ransackable_attributes method to allowlist searchable attributes
def self.ransackable_attributes(auth_object = nil)
  ["character_id", "created_at", "id", "order_id", "price", "quantity", "updated_at"]
end
end