# frozen_string_literal: true

class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.datetime :start_time
      t.boolean :is_closed
      t.references :session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
