# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  devise_scope :user do
    post 'users/sign_up', to: 'devise/registrations#create'
  end
  root to: 'home#index'

  get '/:profile_id', to: 'profile#show', as: 'profile'
end
