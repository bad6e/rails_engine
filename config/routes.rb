Rails.application.routes.draw do
 namespace :api do
    namespace :v1, defaults: {format: :json} do

      resources :customers, only: [:index, :show] do
        get :invoices
        get :transactions
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
        get :invoice_items
        get :merchant

        collection do
            get 'find'
            get 'find_all'
            get 'random'
        end
      end

      resources :invoice_items, only: [:index, :show] do
        get :invoice
        get :item

        collection do
            get 'find'
            get 'find_all'
            get 'random'
        end
      end

      resources :transactions, only: [:index, :show] do
        get :invoice

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
