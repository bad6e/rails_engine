Rails.application.routes.draw do
 namespace :api do
    namespace :v1, defaults: {format: :json} do

      resources :customers, only: [:index, :show] do
        resources :invoices, only: [:index], module: "customers"
        resources :transactions, only: [:index], module: "customers"

        get :favorite_merchant

        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end

      namespace :merchants do
        get :most_revenue
      end

      resources :merchants, only: [:index, :show] do
        resources :items, only: [:index], module: "merchants"
        resources :invoices, only: [:index], module: "merchants"

        get :revenue
        get :favorite_customer
        get :customers_with_pending_invoices

        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end

      resources :items, only: [:index, :show] do
        resources :invoice_items, only: [:index], module: "items"

        member do
          get "merchant", to: "items/merchants#show"
        end

        collection do
            get 'find'
            get 'find_all'
            get 'random'
        end
      end

      resources :invoice_items, only: [:index, :show] do

        member do
          get "invoice", to: "invoice_items/invoices#show"
          get "item", to: "invoice_items/items#show"
        end

        resources :items, only: [:index], module: "invoice_items"

        collection do
            get 'find'
            get 'find_all'
            get 'random'
        end
      end

      resources :transactions, only: [:index, :show] do

        member do
          get "invoice", to: "transactions/invoices#show"
        end

        collection do
            get 'find'
            get 'find_all'
            get 'random'
        end
      end

      resources :invoices, only: [:index, :show] do
        get :transactions
        get :invoice_items
        get :items
        get :customer
        get :merchant

        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end
    end
  end
end
