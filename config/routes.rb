Rails.application.routes.draw do
  get 'user_events', to: 'users#my_events'

  root  to: 'static_pages#home'
  get 'about', to: 'static_pages#about'
  get 'invitations', to: 'invitations#new'
  post 'invitations', to: 'invitations#create'
  root  to: 'events#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  resources :users, only: [:show,:new,:create]
  resources :events
end
