class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :portrait
      t.string :first_name
      t.string :last_name
      t.string :family_name
      t.string :registration_number
      t.string :gender
      t.date :birthday

      t.timestamps
    end
  end
end
