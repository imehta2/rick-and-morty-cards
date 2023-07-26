# db/migrate/20230516123457_create_contact_us.rb (replace '20230516123457' with the actual timestamp in your migration file)

class CreateContactUs < ActiveRecord::Migration[7.0]
  def change
    create_table :contact_us do |t|
      t.string :name
      t.string :email
      t.text :message

      t.timestamps
    end
  end
end
