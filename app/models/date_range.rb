# frozen_string_literal: true

class DateRange < ApplicationRecord
  has_many :time_preferences, dependent: :destroy

  validates :name, presence: true
  validates :start, presence: true
  validates :end, presence: true
end
