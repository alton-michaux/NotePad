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
      FactoryBot.create_list(:child, 5)
      get children_path
      expect(response).to render_template(:index)
    end
  end
  describe 'get child_path' do
    it 'renders the :show template' do
      child = FactoryBot.create(:child)
      get child_path(id: child.id)
      expect(response).to render_template(:show)
    end
    it 'redirects to the index path if the child id is invalid' do
      get child_path(id: 5000)
      expect(response).to redirect_to children_path
    end
  end
  describe 'get new child' do
    it 'renders the :new template' do
      child = FactoryBot.create(:child)
      get new_child_path(id: child.id)
      expect(response).to render_template(:new)
    end
  end
  describe 'get edit_path' do
    it 'renders the :edit template' do
      child = FactoryBot.create(:child)
      get edit_child_path(id: child.id)
      expect(response).to render_template(:edit)
    end
  end
  # describe 'post child_path with valid info' do
  #   it 'saves and redirects to :show path for child' do
  #     child_attributes = FactoryBot.attributes_for(:child)
  #     expect do
  #       post children_path, params: { child: child_attributes }
  #     end.to_not change(Child, :count)
  #     expect(response).to redirect_to child_path(id: child_attributes[:id])
  #   end
  # end
end
