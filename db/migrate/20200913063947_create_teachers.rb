class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.references :user, foreign_key: { on_cascade: :delete }
      t.references :company
      t.integer :status, default: 0, null: false
      t.string :title
      t.string :experience
      t.integer :level, default: 0, null: false
      t.timestamps
    end
  end
end
