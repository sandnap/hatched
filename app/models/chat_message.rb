# frozen_string_literal: true

class ChatMessage < ApplicationRecord
  belongs_to :user
  belongs_to :chat
end
