Rails.application.routes.draw do

  root 'static_pages#top'
  
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:index, :new, :create] do
    resources :requests, only: [:index, :new, :create]
  end
  get 'users/user_check', to: 'users#user_check'
end
