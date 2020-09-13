class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.references :teachers, foreign_key: { on_delete: :cascade }
      t.references :driving_lessons, foreign_key: { on_delete: :cascade }
      t.references :theory_lessons, foreign_key: { on_delete: :cascade }

      t.string :title
      t.string :status
      t.datetime :start
      t.datetime :finish

      t.timestamps
    end

    add_index :schedules, :title
  end
end
