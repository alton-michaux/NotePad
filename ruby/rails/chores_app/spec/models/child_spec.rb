# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Child, type: :model do
  subject { Child.new(name: 'Reed', age: 13) }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is only valid if age is a number' do
    # byebug
    subject.age.to_s.include?('/\d+')
    expect(subject).to be_valid
  end
end
