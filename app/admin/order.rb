# app/admin/order.rb

ActiveAdmin.register Order do
  permit_params :total_price, :user_id

  index do
    selectable_column
    id_column
    column :total_price
    column :user
    actions
  end

  form do |f|
    f.inputs "Order Details" do
      f.input :total_price
      f.input :user
    end
    f.actions
  end
end
