# frozen_string_literal: true

class Deadline < ApplicationRecord
  has_one :study_preference, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :date, presence: true
end
