class AddPriceToCharacters < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :price, :decimal
  end
end
