# frozen_string_literal: true

# Creates table users
class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
