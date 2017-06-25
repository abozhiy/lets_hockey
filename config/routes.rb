Rails.application.routes.draw do

  root 'start#redirect'

  resource :user_sessions, path: 'sessions', only: [:new, :create, :destroy]

  resources :users

  resources :teams do
    member do
      put :add_user
    end
  end

end
