# frozen_string_literal: true

json.extract! study_time, :id, :start, :end, :deadline_id, :created_at, :updated_at
json.url study_time_url(study_time, format: :json)
