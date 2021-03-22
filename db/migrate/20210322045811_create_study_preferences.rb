class CreateStudyPreferences < ActiveRecord::Migration[6.1]
  def change
    create_table :study_preferences do |t|
      t.integer :priority
      t.integer :requiredTime
      t.references :deadline, null: false, foreign_key: true

      t.timestamps
    end
  end
end
