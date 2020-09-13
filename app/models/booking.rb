class Booking < ApplicationRecord
  belongs_to :student, inverse_of: :bookings
  accepts_nested_attributes_for :student

  belongs_to :teacher, inverse_of: :bookings
  accepts_nested_attributes_for :teacher

  belongs_to :schedules, inverse_of: :bookings
  accepts_nested_attributes_for :schedules

  belongs_to :theory_lessons, inverse_of: :bookings
  accepts_nested_attributes_for :theory_lessons

  belongs_to :driving_lessons, inverse_of: :bookings
  accepts_nested_attributes_for :driving_lessons
end
