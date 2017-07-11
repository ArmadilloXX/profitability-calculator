Rails.application.routes.draw do
  root 'welcome#index'
  namespace :api do
    namespace :v1 do
      resources :loans, only: [:index, :show] do
        resources :payments, only: [:index]
      end
    end
  end
  post '/loans', to: 'loans#create', as: 'create_loan'
  get '*any', to: 'welcome#index'
end
