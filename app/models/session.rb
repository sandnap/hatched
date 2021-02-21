# frozen_string_literal: true

class Session < ApplicationRecord
  belongs_to :mentor, class_name: 'User', foreign_key: :mentor_user_id
  belongs_to :mentee, class_name: 'User', foreign_key: :mentee_user_id
  has_one :chat
  has_one :mentor_review
end
