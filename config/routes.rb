Rails.application.routes.draw do
  resources :users, only: [:create, :new, :show]
  # get 'users/new'
  # get 'users/create'
  # get 'users/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
