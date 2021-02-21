# frozen_string_literal: true

class Mentor < ApplicationRecord
  belongs_to :user
  has_many :mentor_skills

  validates :rate_minutes, presence: true, format: { with: /\A([1-9]|[1-5][0-9]|60){1}\z/ }
  validates :rate, presence: true, format: { with: /\A\d+\.\d{1,2}\z/ }
end
