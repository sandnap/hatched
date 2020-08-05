# frozen_string_literal: true

class CreateMentors < ActiveRecord::Migration[6.0]
  def change
    create_table :mentors do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :rate_minutes
      t.decimal :rate

      t.timestamps
    end
  end
end
