class Profile < ApplicationRecord
  belongs_to :user, inverse_of: :profile
  accepts_nested_attributes_for :user
  mount_uploader :potrait, ImageUploader
end
