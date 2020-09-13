class TheoryExam < ApplicationRecord
  belongs_to :teacher, inverse_of: :driving_lessons
  belongs_to :schedule, inverse_of: :driving_lessons
  belongs_to :booking, inverse_of: :driving_lessons
  has_many :lesson_attachments, dependent: :destroy, inverse_of: :driving_lessons
  accepts_nested_attributes_for :lesson_attachments
end
