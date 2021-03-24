# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  resources :deadlines
  resources :study_preferences

  get 'signup' => 'signup#signup'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
