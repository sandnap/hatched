# frozen_string_literal: true

class MentorSkill < ApplicationRecord
  belongs_to :mentor
  belongs_to :skill
end
