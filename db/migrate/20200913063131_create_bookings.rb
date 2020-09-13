class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :teachers, foreign_key: { on_delete: :cascade }
      t.references :students, foreign_key: { on_delete: :cascade }
      t.references :schedules, foreign_key: { on_delete: :cascade }
      t.references :theory_lessons, foreign_key: { on_delete: :cascade }
      t.references :driving_lessons, foreign_key: { on_delete: :cascade }
      t.string :type
      t.integer :duration

      t.timestamps
    end
  end
end
