# app/admin/category.rb
ActiveAdmin.register Category do
  permit_params :name

  # Customize the index view to display the list of categories
  index do
    selectable_column
    id_column
    column :name
    actions
  end

  # Customize the form for creating/editing categories
  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end
end
