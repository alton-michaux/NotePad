# frozen_string_literal: true

Rails.application.routes.draw do
  resources :chores
  resources :children
  root to: 'children#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
