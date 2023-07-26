# db/migrate/20230516123456_create_about_us.rb (replace '20230516123456' with the actual timestamp in your migration file)

class CreateAboutUs < ActiveRecord::Migration[7.0]
  def change
    create_table :about_us do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
