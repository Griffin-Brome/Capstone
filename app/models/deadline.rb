# frozen_string_literal: true

# Represents a deadline on the calendar
class Deadline < ApplicationRecord
  has_one :study_preference, dependent: :destroy
  has_many :study_time, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :date, presence: true

  ##
  # Alias date to start_time so that we can integrate seamlessly with simple
  # calendar https://github.com/excid3/simple_calendar#rendering-events
  def start_time
    date
  end
end
