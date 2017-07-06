Rails.application.routes.draw do
  root 'welcome#index'
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'
  resources :loans, only: [:show]
end
