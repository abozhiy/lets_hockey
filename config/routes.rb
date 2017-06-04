Rails.application.routes.draw do

  root 'users#index'

  resource :user_sessions, path: 'sessions', only: [:new, :create, :destroy]

  resources :users
end
