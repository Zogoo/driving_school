class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.references :users, foreign_key: { on_delete: :cascade }
      t.references :theory_lessons, foreign_key: { on_delete: :cascade }
      t.references :driving_lessons, foreign_key: { on_delete: :cascade }
      t.references :schedules, foreign_key: { on_delete: :cascade }
      t.references :teachers, foreign_key: { on_delete: :cascade }
      t.references :students, foreign_key: { on_delete: :cascade }
      t.references :bookings, foreign_key: { on_delete: :cascade }

      t.string :name

      t.timestamps
    end

    add_index :companies, :name, unique: true
  end
end
