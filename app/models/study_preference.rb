class StudyPreference < ApplicationRecord
  belongs_to :deadline

  validates :priority, presence: true
  validates :requiredTime, presence: true
  validates :deadline, presence: true
end
