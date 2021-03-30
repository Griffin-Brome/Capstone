# frozen_string_literal: true

# Time Preferences Migrations
class CreateTimePreferences < ActiveRecord::Migration[6.1]
  def change
    create_table :time_preferences do |t|
      t.string :name
      t.boolean :available
      t.string :dayOfWeek
      t.time :start
      t.time :end
      t.references :date_range, null: false, foreign_key: true

      t.timestamps
    end
  end
end
