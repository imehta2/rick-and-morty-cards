# app/models/contact_us.rb
class ContactUs < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    %w[content created_at id updated_at] # Add attributes you want to allow for searching
  end
end