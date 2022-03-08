# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'

  resources :posts do
    scope module: :posts do
      resources :comments
      resources :likes, only: %i[create destroy]
    end
  end
end
