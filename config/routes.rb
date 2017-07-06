Rails.application.routes.draw do
  root 'welcome#index'
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'
  resources :loans, only: [:index, :show] do
    resources :payments, only: [:index]
  end
end
