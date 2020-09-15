class CreateTheoryLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :theory_lessons do |t|
      t.references :company
      t.references :teacher
      t.references :schedule
      t.references :booking

      t.string :title
      t.integer :duration
      t.string :category
      t.text :content
      t.timestamps
    end
  end
end
