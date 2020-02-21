Rails.application.routes.draw do
  root 'sessions#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  get '/events/:event_id/attend', to: 'events#attend', as: 'attend_event'
  # post '/events/:id/invite', to: 'events#invite', as: 'invite_event'
  # post '/events/:event_id/attend', to: 'events#attend', as: 'attend_event'
  get '/invited_events', to: 'users#invited_events', as: 'invited_events'

  resources :users, only: [:create, :show]
  resources :events, only: [:index, :new, :create, :show]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
