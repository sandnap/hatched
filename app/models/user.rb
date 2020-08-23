# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :mentor
  has_many :chat_messages
  has_many :mentor_sessions, class_name: 'Session', foreign_key: :mentor_user_id
  has_many :mentee_sessions, class_name: 'Session', foreign_key: :mentee_user_id

  validates_presence_of :email

  accepts_nested_attributes_for :mentor,
                                reject_if: proc { |m| m['rate'].blank? },
                                allow_destroy: true

  scope :mentors, -> { joins :mentor }

  def full_name
    "#{first_name} #{last_name}"
  end

  def created_at_short
    created_at.strftime('%m/%d/%Y')
  end

  def mentor?
    !mentor.nil?
  end
end
