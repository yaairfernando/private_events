# frozen_string_literal: true

Rails.application.routes.draw do
  root 'sessions#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  get '/events/:id/invite', to: 'events#invite', as: 'invite_event'
  get '/events/:id/attend', to: 'events#attend', as: 'attend_event'
  get '/users/invitations', to: 'users#invited_events', as: 'invited_events'

  resources :users, only: %i[create show]
  resources :events, only: %i[index new create show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
