class CreateTheoryLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :theory_lessons do |t|
      t.references :companies
      t.references :teachers
      t.references :schedules
      t.references :bookings

      t.string :title
      t.integer :duration
      t.string :category
      t.text :content
      t.timestamps
    end
  end
end
