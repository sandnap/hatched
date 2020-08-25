# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    expect(User.new(email: 'test@tester.com', password: 'password')).to be_valid
  end

  it 'is expecting an email address' do
    expect(User.new(password: 'password')).not_to be_valid
  end

  it 'is expecting a password' do
    expect(User.new(email: 'email@tester.com')).not_to be_valid
  end

  it 'is expecting a valid email address' do
    expect(User.new(email: 'testgoogle.com', password: 'password')).not_to be_valid
  end

  it 'is expecting a password of at least 6 characters' do
    expect(User.new(email: 'test@google.com', password: 'p')).not_to be_valid
  end
end
