Rails.application.routes.draw do
 namespace :api do
    namespace :v1, defaults: {format: :json} do

      resources :customers, only: [:index, :show] do
        get '/invoices', to: 'customers#invoices'
        get '/transactions', to: 'customers#transactions'
        get '/favorite_merchant', to: 'customers#favorite_merchant'
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end

      resources :merchants, only: [:index, :show] do
        get '/items', to: 'merchants#items'
        get '/invoices', to: 'merchants#invoices'
        get '/revenue', to: 'merchants#revenue'
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end

      resources :items, only: [:index, :show] do
        get '/invoice_items', to: 'items#invoice_items'
        get '/merchant', to: 'items#merchant'

        collection do
            get 'find'
            get 'find_all'
            get 'random'
        end
      end

      resources :invoice_items, only: [:index, :show] do
        get '/invoice', to: 'invoice_items#invoice'
        get '/item', to: 'invoice_items#item'

        collection do
            get 'find'
            get 'find_all'
            get 'random'
        end
      end

      resources :transactions, only: [:index, :show] do
        get '/invoice', to: 'transactions#invoice'
        collection do
            get 'find'
            get 'find_all'
            get 'random'
        end
      end

      resources :invoices, only: [:index, :show] do
        get '/transactions', to: 'invoices#transactions'
        get '/invoice_items', to: 'invoices#invoice_items'
        get '/items', to: 'invoices#items'
        get '/customer', to: 'invoices#customer'
        get '/merchant', to: 'invoices#merchant'

        collection do
            get 'find'
            get 'find_all'
            get 'random'
        end
      end
    end
  end
end
