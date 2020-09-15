class TheoryExam < ApplicationRecord
  belongs_to :teacher
  belongs_to :schedule
  belongs_to :booking
  has_many :lesson_attachments, dependent: :destroy
  accepts_nested_attributes_for :lesson_attachments
end
