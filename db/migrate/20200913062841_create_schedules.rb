class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.references :teacher
      t.string :title
      t.datetime :start
      t.datetime :finish

      t.timestamps
    end

    add_index :schedules, :title
  end
end
