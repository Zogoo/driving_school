class Schedule < ApplicationRecord
  belongs_to :teacher
  accepts_nested_attributes_for :teacher

  belongs_to :driving_lesson, optional: true
  accepts_nested_attributes_for :driving_lesson

  belongs_to :theory_lesson, optional: true
  accepts_nested_attributes_for :theory_lesson

  has_many :bookings
  accepts_nested_attributes_for :bookings

  enum status: %i[active canceled suspended]
end
