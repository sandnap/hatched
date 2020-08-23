# frozen_string_literal: true

class Mentor < ApplicationRecord
  belongs_to :user
  has_many :mentor_skills

  validates_presence_of :rate, :rate_minutes
end
