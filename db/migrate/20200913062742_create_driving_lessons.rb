class CreateDrivingLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :driving_lessons do |t|
      t.references :companies
      t.references :teachers, foreign_key: { on_delete: :cascade }
      t.references :schedules
      t.references :bookings

      t.timestamps
    end
  end
end
