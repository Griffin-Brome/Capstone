# frozen_string_literal: true

class TimePreference < ApplicationRecord
  belongs_to :date_range

  validates :name, presence: true
  validates :available, presence: true
  validates :dayOfWeek, presence: true
  validates :start, presence: true
  validates :end, presence: true
end
