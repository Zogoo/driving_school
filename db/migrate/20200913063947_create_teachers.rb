class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.references :companies, :foreign_key
      t.references :users, foreign_key: { on_cascade: :delete }
      t.string :title
      t.string :experience
      t.integer :level
      t.timestamps
    end
  end
end
