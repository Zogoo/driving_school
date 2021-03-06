class Company < ApplicationRecord
  has_many :users
  accepts_nested_attributes_for :users
  has_many :teachers, dependent: :destroy
  accepts_nested_attributes_for :teachers
  has_many :studends, dependent: :destroy
  accepts_nested_attributes_for :studends
  has_many :theory_lessons, dependent: :destroy
  accepts_nested_attributes_for :theory_lessons
  has_many :driving_lessons, dependent: :destroy
  accepts_nested_attributes_for :driving_lessons
  has_many :schedules, dependent: :destroy
  accepts_nested_attributes_for :schedules
  has_many :bookings, dependent: :destroy
  accepts_nested_attributes_for :bookings
end
