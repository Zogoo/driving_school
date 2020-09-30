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
      t.string :status, default: 0, null: false
      t.string :cancel_reason, default: '', null: false
      t.integer :cost
      t.boolean :refunded, default: false, null: false

      t.timestamps
    end
  end
end
