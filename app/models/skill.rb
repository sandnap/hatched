# frozen_string_literal: true

class Skill < ApplicationRecord
  has_many :mentor_skills
end
