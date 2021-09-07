# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tracks
  devise_for :users, controllers: { registrations: 'registrations' }
  devise_scope :user do
    post 'users/sign_up', to: 'devise/registrations#create'
  end
  root to: 'home#index'

  get '/:profile_id', to: 'profile#show', as: 'profile'
  get '/users/:id/tracks', to: 'users#tracks', as: 'user_tracks'
end
