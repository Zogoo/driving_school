class TheoryExamAttachment < ApplicationRecord
  mount_uploader :image, AttachmentUploader
  belongs_to :theory_exam, dependent: :destroy
end
