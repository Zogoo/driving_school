class Schedule < ApplicationRecord
  belongs_to :teacher, inverse_of: :schedules
  accepts_nested_attributes_for :teacher

  belongs_to :driving_lesson, inverse_of: :schedules
  accepts_nested_attributes_for :driving_lesson

  belongs_to :theory_lesson, inverse_of: :schedules
  accepts_nested_attributes_for :theory_lesson

  has_many :bookings, inverse_of: :schedules
  accepts_nested_attributes_for :bookings
end
