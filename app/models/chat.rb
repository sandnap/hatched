# frozen_string_literal: true

class Chat < ApplicationRecord
  belongs_to :session
  has_many :chat_messages
end
