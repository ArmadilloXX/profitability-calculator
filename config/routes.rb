Rails.application.routes.draw do
  root 'welcome#index'
  # get '/dashboard', to: 'dashboard#index', as: 'dashboard'
  post '/loans', to: 'loans#create', as: 'create_loan'
  resources :loans, only: [:index] do
    post '/payments', to: 'payments#create', as: 'create_payment'
    resources :payments, only: [:index]
  end
  get '*any', to: 'welcome#index'
end
