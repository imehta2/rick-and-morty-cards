class Province < ApplicationRecord
  has_many :users
  validates :name, presence: true, uniqueness: true
  validates :PST, :GST, :HST, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
end
