# frozen_string_literal: true

# Deadline Migration
class CreateDeadlines < ActiveRecord::Migration[6.1]
  def change
    create_table :deadlines do |t|
      t.string :name
      t.text :description
      t.datetime :date

      t.timestamps
    end
  end
end
