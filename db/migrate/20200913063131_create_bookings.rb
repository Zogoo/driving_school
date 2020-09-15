class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :teacher, foreign_key: { on_delete: :cascade }
      t.references :student, foreign_key: { on_delete: :cascade }
      t.references :schedule, foreign_key: { on_delete: :cascade }
      t.references :theory_lesson, foreign_key: { on_delete: :cascade }
      t.references :driving_lesson, foreign_key: { on_delete: :cascade }
      t.string :type
      t.string :title
      t.datetime :start
      t.integer :duration
      t.string :status
      t.string :cancel_reason
      t.integer :cost
      t.boolean :refunded

      t.timestamps
    end
  end
end
