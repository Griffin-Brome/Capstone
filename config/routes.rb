Rails.application.routes.draw do
  resources :exampleusers
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'home/sign_up'
  root to: "home#sign_up"
end
