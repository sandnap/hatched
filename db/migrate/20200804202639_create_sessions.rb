# frozen_string_literal: true

class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.datetime :scheduled_start_time
      t.datetime :actual_start_time
      t.integer :scheduled_minutes
      t.integer :actual_minutes
      t.text :topic
      t.references :mentor_user, null: false, foreign_key: { to_table: :users }
      t.references :mentee_user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
