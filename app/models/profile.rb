class Profile < ApplicationRecord
  belongs_to :user
  mount_uploader :potrait, ImageUploader
end
