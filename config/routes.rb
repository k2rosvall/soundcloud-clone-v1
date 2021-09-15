# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tracks do
    resources :likes
    resources :comments, only: %i[create destroy]
  end
  devise_for :users, controllers: { registrations: 'registrations' }
  devise_scope :user do
    post 'users/sign_up', to: 'devise/registrations#create'
  end
  root to: 'home#index'

  get '/:profile_id', to: 'profile#show', as: 'profile'

  resources :relationships, only: %i[create destroy]
end
