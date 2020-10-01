class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.references :user, foreign_key: { on_cascade: :delete }, null: false
      t.references :company, foreign_key: true, null: true
      t.string :title
      t.integer :status, default: 0, null: false
      t.integer :level, default: 0, null: false
      t.string :experience
      t.timestamps
    end
  end
end
