Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      resources :merchants, only: [:index, :show] do
        scope module: 'merchants' do
          collection do
            get 'find', to: 'find#show'
            get 'find_all', to: 'find#index'
          end
          resources :invoices, only: [:index]
          resources :items, only: [:index]
        end
      end

      resources :customers, only: [:index, :show] do
        scope module: 'customers' do
          collection do
            get 'find', to: 'find#show'
            get 'find_all', to: 'find#index'
          end
          resources :invoices, only: [:index]
          resources :transactions, only: [:index]
        end
      end

      resources :items, only: [:index, :show] do
        scope module: 'items' do
          collection do
            get 'find', to: 'find#show'
            get 'find_all', to: 'find#index'
            get ':item_id/merchant', to: 'merchants#show'
          end
          resources :invoice_items, only: [:index]
        end
      end

      resources :invoices, only: [:index, :show] do
        scope module: 'invoices' do
          collection do
            get 'find', to: 'find#show'
            get 'find_all', to: 'find#index'
            get ':invoice_id/merchant', to: 'merchants#show'
            get ':invoice_id/customer', to: 'customers#show'
          end
          resources :invoice_items, only: [:index]
          resources :transactions, only: [:index]
          resources :items, only: [:index]
        end
      end

      resources :invoice_items, only: [:index, :show] do
        scope module: 'invoice_items' do
          collection do
            get 'find', to: 'find#show'
            get 'find_all', to: 'find#index'
            get ':invoice_item_id/invoice', to: 'invoices#show'
            get ':invoice_item_id/item', to: 'items#show'
          end
        end
      end

      resources :transactions, only: [:index, :show] do
        scope module: 'transactions' do
          collection do
            get 'find', to: 'find#show'
            get 'find_all', to: 'find#index'
            get ':transaction_id/invoice', to: 'invoices#show'
          end
        end
      end
    end
  end
end
