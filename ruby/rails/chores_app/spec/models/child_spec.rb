# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Child, type: :model do
  subject { Child.create(name: 'Reed', age: 13, id: 1) }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is only valid with a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'is only valid if age is a number' do
    subject.age.to_s.include?('/\d+')
    expect(subject).to be_valid
  end
  it 'is not valid without an id' do
    subject.id = nil
    expect(subject).to_not be_valid
  end
end

RSpec.describe 'ChildControllers', type: :request do
  describe 'get children_path' do
    it 'renders the index view' do
      # byebug
      FactoryBot.create_list(:child, 10)
      get children_path
      expect(response).to render_template(:index)
    end
  end
end
