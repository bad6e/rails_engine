Rails.application.routes.draw do
 namespace :api do
    namespace :v1, defaults: {format: :json} do

      resources :customers, only: [:index, :show] do
        collection do
          get 'find'
          get 'find_all'
        end
      end

      resources :merchants, only: [:index, :show] do
        collection do
          get 'find'
          get 'find_all'
        end
      end

      resources :items, only: [:index, :show] do
        collection do
            get 'find'
            get 'find_all'
        end
      end

      resources :invoice_items, only: [:index, :show] do
        collection do
            get 'find'
            get 'find_all'
        end
      end

      resources :transactions, only: [:index, :show] do
        collection do
            get 'find'
            get 'find_all'
        end
      end

      resources :invoices, only: [:index, :show] do
        collection do
            get 'find'
            get 'find_all'
        end
      end
    end
  end
end
