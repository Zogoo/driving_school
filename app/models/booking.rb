class Booking < ApplicationRecord
  belongs_to :student
  belongs_to :teacher
  accepts_nested_attributes_for :teacher

  belongs_to :schedules
  accepts_nested_attributes_for :schedules

  belongs_to :theory_lessons
  accepts_nested_attributes_for :theory_lessons

  belongs_to :driving_lessons
  accepts_nested_attributes_for :driving_lessons
end
