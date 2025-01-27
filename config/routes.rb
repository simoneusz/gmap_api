Rails.application.routes.draw do
  resources :posts
  get 'up' => 'rails/health#show', as: :rails_health_check
  namespace :api do
    resources :tickets, only: [:create]
  end
end
