# frozen_string_literal: true

Rails.application.routes.draw do
  root 'deadlines#calendar'
  devise_for :users, controllers: {
    confirmations: 'confirmations'
  }
  resources :deadlines
  resources :study_preferences
  resources :date_ranges do
    resources :time_preferences
  end

  resources :signup
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
