# app/models/category.rb
class Category < ApplicationRecord
  has_many :characters
  validates :name, presence: true

  # Define the ransackable_attributes method to allowlist searchable attributes
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "updated_at"]
  end

  # Define the ransackable_associations method to allowlist searchable associations
  def self.ransackable_associations(auth_object = nil)
    ["characters"]
  end
end
