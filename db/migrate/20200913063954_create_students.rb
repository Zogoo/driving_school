class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.references :company
      t.references :user, foreign_key: { on_cascade: :delete }
      t.integer :status
      t.date :start
      t.date :finish
      t.integer :payment
      t.string :suspended_reason
      t.timestamps
    end
  end
end
