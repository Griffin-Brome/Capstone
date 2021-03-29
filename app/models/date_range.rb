class DateRange < ApplicationRecord

  validates :name, presence: true
  validates :start, presence: true
  validates :end, presence: true
end
