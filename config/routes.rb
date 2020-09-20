# frozen_string_literal: true

Rails.application.routes.draw do
  resources :roles
  resources :companies
  resources :billable_hours

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  get 'invoice', to: 'billable_hours#invoice'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
