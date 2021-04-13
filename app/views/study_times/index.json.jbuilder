# frozen_string_literal: true

json.array! @study_times, partial: 'study_times/study_time', as: :study_time
