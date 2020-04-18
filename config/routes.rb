Rails.application.routes.draw do
  root 'static_pages#top'
  resources :users, only: [:new, :create]
  get 'users/user_check', to: 'users#user_check'
end
