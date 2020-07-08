Rails.application.routes.draw do
  resources :volunteers
  resources :tasks
  resources :users, only: [:create]
  post 'login', to: 'authentication#login'
end
