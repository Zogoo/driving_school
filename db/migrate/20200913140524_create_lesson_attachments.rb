class CreateLessonAttachments < ActiveRecord::Migration[6.0]
  def change
    create_table :lesson_attachments do |t|
      t.references :theory_lessons, foreign_key: { on_delete: :cascade }
      t.references :driving_lessons, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
