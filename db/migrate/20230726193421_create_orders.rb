class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.decimal :total_price
      t.integer :user_id

      t.timestamps
    end

    add_reference :orders, :province, foreign_key: true
    add_column :orders, :name, :string
    add_column :orders, :address, :text
    add_column :orders, :postal_code, :string
    add_column :orders, :status, :string, default: "pending"
  end
end