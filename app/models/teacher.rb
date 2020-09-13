class Teacher < ApplicationRecord
  belongs_to :user, inverse_of: :teacher
  accepts_nested_attributes_for :user

  has_many :schedules, dependent: :destroy, inverse_of: :teacher
  accepts_nested_attributes_for :schedules

  has_many :theory_lessons, dependent: :destroy, inverse_of: :teacher
  accepts_nested_attributes_for :theory_lessons

  has_many :driving_lessons, dependent: :destroy, inverse_of: :teacher
  accepts_nested_attributes_for :driving_lessons
end
