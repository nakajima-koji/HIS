Rails.application.routes.draw do

  root 'static_pages#top'
  
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:index, :new, :create] do
    member do
      
    end
    resources :purchases, only: [:index, :new, :create, :show]
  end
  get 'users/user_check', to: 'users#user_check'
  post 'purchases/pay', to: 'purchases#pay'
end
