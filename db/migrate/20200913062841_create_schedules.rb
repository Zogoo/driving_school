class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.references :teacher, foreign_key: { on_delete: :cascade }
      t.references :driving_lesson, foreign_key: { on_delete: :cascade }
      t.references :theory_lesson, foreign_key: { on_delete: :cascade }

      t.string :title
      t.integer :status, default: 0, null: false
      t.integer :step
      t.datetime :start
      t.datetime :finish

      t.timestamps
    end

    add_index :schedules, :title
  end
end
