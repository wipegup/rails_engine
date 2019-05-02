Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index]
      resources :customers, only: [:index, :show] do
        scope module: 'customers' do
          collection do
            get 'find', to: 'find#show'
            get 'find_all', to: 'find#index'
          end
          resources :invoices, only: [:index]
        end
      end
      resources :items, only: [:index]
      resources :invoices, only: [:index]
      resources :invoice_items, only: [:index, :show]
      resources :transactions, only: [:index]
    end
  end
end
