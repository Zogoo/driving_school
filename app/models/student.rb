class Student < ApplicationRecord
  belongs_to :user
  accepts_nested_attributes_for :user

  has_many :bookings, dependent: :destroy
  accepts_nested_attributes_for :bookings

  enum status: %i[pending active suspended blocked]
  
end
