Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index]
      get '/customers/:id/:relation', to: 'customer_relations#show'
      resources :customers, only: [:index, :show]
      resources :items, only: [:index]
      resources :invoices, only: [:index]
      resources :invoice_items, only: [:index, :show]
      resources :transactions, only: [:index]
    end
  end
end
