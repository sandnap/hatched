# frozen_string_literal: true

class CreateChatMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :chat_messages do |t|
      t.text :message
      t.datetime :posted_at
      t.references :user, null: false, foreign_key: true
      t.references :chat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
