# frozen_string_literal: true

# Studytime migration
class CreateStudyTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :study_times do |t|
      t.datetime :start
      t.datetime :end
      t.references :deadline, null: false, foreign_key: true

      t.timestamps
    end
  end
end
