class TheoryLesson < ApplicationRecord
  belongs_to :company
  belongs_to :teacher
  has_many :bookings
  has_many :schedules
end
