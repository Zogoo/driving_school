class Booking < ApplicationRecord
  belongs_to :student
  belongs_to :teacher
  accepts_nested_attributes_for :teacher

  belongs_to :schedule
  accepts_nested_attributes_for :schedule

  belongs_to :theory_lesson
  accepts_nested_attributes_for :theory_lesson

  belongs_to :driving_lesson
  accepts_nested_attributes_for :driving_lesson
  enum status: %i[active done canceled]
end
