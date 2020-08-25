# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mentor, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(email: 'test@tester.com', password: 'password')
    expect(user.build_mentor(rate: 25.0, rate_minutes: 15)).to be_valid
  end

  it 'is not valid without rate_minutes' do
    user = User.new(email: 'test@tester.com', password: 'password')
    expect(user.build_mentor(rate: 25.0)).to_not be_valid
  end

  it 'is not valid without rate' do
    user = User.new(email: 'test@tester.com', password: 'password')
    expect(user.build_mentor(rate_minutes: 15)).to_not be_valid
  end
end

RSpec.describe Mentor, type: :model do
  it 'is not valid if rate minutes is not an integer' do
    user = User.new(email: 'test@tester.com', password: 'password')
    expect(user.build_mentor(rate: 25.0, rate_minutes: 'A')).not_to be_valid
  end

  it 'is valid if rate minutes is = 60' do
    user = User.new(email: 'test@tester.com', password: 'password')
    expect(user.build_mentor(rate: 25.0, rate_minutes: 60)).to be_valid
  end

  it 'is not valid if rate minutes is < 1' do
    user = User.new(email: 'test@tester.com', password: 'password')
    expect(user.build_mentor(rate: 25.0, rate_minutes: 0)).not_to be_valid
  end

  it 'is not valid if rate minutes is > 60' do
    user = User.new(email: 'test@tester.com', password: 'password')
    expect(user.build_mentor(rate: 25.0, rate_minutes: 61)).not_to be_valid
  end
end

RSpec.describe Mentor, type: :model do
  it 'is valid with a precision of two' do
    user = User.new(email: 'test@tester.com', password: 'password')
    expect(user.build_mentor(rate: 25.55, rate_minutes: 1)).to be_valid
  end

  it 'is not valid with a precision of three' do
    user = User.new(email: 'test@tester.com', password: 'password')
    expect(user.build_mentor(rate: 25.555, rate_minutes: 1)).not_to be_valid
  end

  it 'is not valid if rate is not formatted correctly' do
    user = User.new(email: 'test@tester.com', password: 'password')
    expect(user.build_mentor(rate: 25, rate_minutes: 61)).not_to be_valid
  end
end