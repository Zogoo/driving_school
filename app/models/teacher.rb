class Teacher < ApplicationRecord
  belongs_to :company
  belongs_to :user

  has_many :schedules, dependent: :destroy
  accepts_nested_attributes_for :schedules

  has_many :bookings, dependent: :destroy
  accepts_nested_attributes_for :bookings

  has_many :theory_lessons, dependent: :destroy
  accepts_nested_attributes_for :theory_lessons

  has_many :driving_lessons, dependent: :destroy
  accepts_nested_attributes_for :driving_lessons

  enum status: %i[pending active suspended in_holiday blocked]
  enum level: %i[junior intermediate advanced professional]
end
