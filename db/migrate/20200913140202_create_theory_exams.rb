class CreateTheoryExams < ActiveRecord::Migration[6.0]
  def change
    create_table :theory_exams do |t|
      t.references :company, foreign_key: { on_cascade: :delete }
      t.references :teacher
      t.references :student
      t.string :title
      t.integer :duration
      t.text :content
      t.integer :score
      t.timestamps
    end
  end
end
