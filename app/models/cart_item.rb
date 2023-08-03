class CartItem < ApplicationRecord
  belongs_to :character

   # Define the ransackable_attributes method to allowlist searchable attributes
 def self.ransackable_attributes(auth_object = nil)
  ["character_id", "created_at", "id", "quantity", "updated_at"]
end
end
