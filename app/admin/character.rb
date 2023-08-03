ActiveAdmin.register Character do
  permit_params :name, :status, :species, :gender, :origin, :location, :image, :price, :category_id

  index do
    selectable_column
    id_column
    column :name
    column :status
    column :species
    column :gender
    column :origin
    column :location
    column :image
    column :price
    column :category
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :status
      f.input :species
      f.input :gender
      f.input :origin
      f.input :location
      f.input :image
      f.input :price
      f.input :category_id, as: :select, collection: Category.all.map { |c| [c.name, c.id] }
    end
    f.actions
  end
end
