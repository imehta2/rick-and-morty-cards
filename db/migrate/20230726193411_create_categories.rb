class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end

    # Seed the database with categories
    Category.create(name: 'Rare')
    Category.create(name: 'Common')
    Category.create(name: 'Uncommon')
  end
end
