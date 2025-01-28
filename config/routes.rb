# frozen_string_literal: true

Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check
  namespace :api do
    resources :tickets, only: %i[create index show]
  end
end
