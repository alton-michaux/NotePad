# frozen_string_literal: true

require 'rails_helper'

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
  describe 'post children_path with valid info' do
    it 'saves and redirects to :show path for child' do
      child_params = FactoryBot.create(:child)
      # byebug
      expect do
        post children_path, params: { child: child_params }
      end.to change(Child, :count)
      # byebug
      expect(response).to redirect_to child_path(id: child_params[:id])
    end
  end
end
