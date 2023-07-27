# app/models/about_us.rb

class AboutUs < ApplicationRecord
  # ... your existing code ...

  def self.ransackable_attributes(auth_object = nil)
    ["content", "created_at", "id", "updated_at"]
  end

  # ... your existing code ...
end
