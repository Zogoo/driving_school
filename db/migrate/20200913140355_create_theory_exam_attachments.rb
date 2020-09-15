class CreateTheoryExamAttachments < ActiveRecord::Migration[6.0]
  def change
    create_table :theory_exam_attachments do |t|
      t.references :theory_exam, foreign_key: { on_cascade: :delete }
      t.string :image

      t.timestamps
    end
  end
end
