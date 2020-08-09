# frozen_string_literal: true

class User < ApplicationRecord
  has_one :mentor
  has_many :chat_messages
  has_many :mentor_sessions, class_name: 'Session', foreign_key: :mentor_user_id
  has_many :mentee_sessions, class_name: 'Session', foreign_key: :mentee_user_id

  scope :mentors, -> { joins :mentor }

  def created_at_short
    created_at.strftime('%m/%d/%Y')
  end

  def mentor?
    !mentor.nil?
  end
end
