class Booking < ApplicationRecord
  belongs_to :student, inverse_of: :bookings
  nested_attributes_for :student
end
