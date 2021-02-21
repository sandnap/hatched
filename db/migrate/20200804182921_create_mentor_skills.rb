# frozen_string_literal: true

class CreateMentorSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :mentor_skills do |t|
      t.references :mentor, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true
      t.integer :expertise

      t.timestamps
    end
  end
end
