class Student < ApplicationRecord
  belongs_to :user, inverse_of: :student

  has_many :bookings, dependent: :destroy, inverse_of: :student
  accepts_nested_attributes_for :bookings
end
