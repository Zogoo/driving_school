class LessonAttachment < ApplicationRecord
  mount_uploader :image, AttachmentUploader
  belongs_to :driving_lessons
  belongs_to :theory_lessons
end
