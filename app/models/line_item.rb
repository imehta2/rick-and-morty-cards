# app/models/line_item.rb
class LineItem < ApplicationRecord
  belongs_to :character
  belongs_to :order
end