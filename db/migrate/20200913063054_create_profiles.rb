class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      # Business model
      t.references :users, foreign_key: { on_delete: :cascade }

      t.string :portrait
      t.string :first_name
      t.string :last_name
      t.string :family_name
      t.string :registration_number
      t.string :gender
      t.date :birthday
      t.string :mobile_number
      t.string :tel_number
      t.string :home_address
      t.string :work_address

      t.timestamps
    end
  end
end
