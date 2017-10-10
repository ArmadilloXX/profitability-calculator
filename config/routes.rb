Rails.application.routes.draw do
  root 'welcome#index'
  namespace :api do
    namespace :v1 do
      resources :loans, only: [:index, :show, :create] do
        resources :payments, only: [:index, :create]
      end
      resources :borrowers, only: [:index]
      resources :loan_plans, only: [:index]
    end
  end
  get '*any', to: 'welcome#index'
end
