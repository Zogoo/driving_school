class CreateDrivingLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :driving_lessons do |t|
      t.references :company
      t.references :teacher, foreign_key: { on_delete: :cascade }
      t.references :schedule
      t.references :booking

      t.timestamps
    end
  end
end
