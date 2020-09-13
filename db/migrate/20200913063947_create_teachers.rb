class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.references :driving_lessons, foreign_key: { on_delete: :cascade }
      t.references :theory_lessons, foreign_key: { on_delete: :cascade }
      t.references :schedules, foreign_key: { on_delete: :cascade }
      t.references :bookings, foreign_key: { on_delete: :cascade }
      t.timestamps
    end
  end
end
