class TheoryLesson < ApplicationRecord
  belongs_to :company
  belongs_to :teacher
  has_many :bookings, inverse_of: :theory_lessons
  accepts_nested_attributes_for :bookings

  has_many :schedules, inverse_of: :theory_lessons
  accepts_nested_attributes_for :schedules
end
