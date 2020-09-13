class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.references :companies, :foreign_key
      t.references :users, foreign_key: { on_cascade: :delete }

      t.timestamps
    end
  end
end
