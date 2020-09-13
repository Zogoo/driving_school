class CreateDrivingLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :driving_lessons do |t|

      t.timestamps
    end
  end
end
