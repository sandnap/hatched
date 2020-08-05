# frozen_string_literal: true

class CreateMentorReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :mentor_reviews do |t|
      t.decimal :rating
      t.text :description
      t.references :session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
