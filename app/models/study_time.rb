# frozen_string_literal: true

# Represents a studytime time block
class StudyTime < ApplicationRecord
  belongs_to :deadline
end
