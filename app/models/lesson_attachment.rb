class LessonAttachment < ApplicationRecord
  mount_uploader :image, AttachmentUploader
  belongs_to :driving_lessons, inverse_of: :lesson_attachment
  belongs_to :theory_lessons, inverse_of: :lesson_attachment
end
