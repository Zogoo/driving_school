class Schedule < ApplicationRecord
  belongs_to :teacher, inverse_of: :schedules
  accepts_nested_attributes_for :teacher

end
