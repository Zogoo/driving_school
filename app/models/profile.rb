class Profile < ApplicationRecord
  mount_uploader :portrait, ImageUploader
  belongs_to :user
end
