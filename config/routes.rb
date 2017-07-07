Rails.application.routes.draw do
  root 'welcome#index'
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'
  post '/loans', to: 'loans#create', as: 'create_loan'
  resources :loans, only: [:index, :show] do
    post '/payments', to: 'payments#create', as: 'create_payment'
    resources :payments, only: [:index]
  end
end
