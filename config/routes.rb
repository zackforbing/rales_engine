Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :customers do
        get '/random', to: "random#show"
        get '/find', to: "find#show"
        get '/find_all', to: "find#index"
        get '/:id/invoices', to: "invoices#index"
        get '/:id/transactions', to: "transactions#index"
        get '/:id/favorite_merchant', to: "favorite_merchant#show"
      end

      namespace :invoice_items do
        get '/:id/invoice', to: "invoices#show"
        get '/:id/item', to: "items#show"
        get '/random', to: "random#show"
        get '/find', to: "find#show"
        get '/find_all', to: "find#index"
      end

      namespace :invoices do
        get '/:id/customer', to: "customers#show"
        get '/:id/invoice_items', to: "invoice_items#index"
        get '/:id/items', to: "items#index"
        get '/:id/merchant', to: "merchants#show"
        get '/:id/transactions', to: "transactions#index"
        get '/random', to: "random#show"
        get '/find', to: "find#show"
        get '/find_all', to: "find#index"
      end

      namespace :items do
        get '/:id/invoice_items', to: "invoice_items#index"
        get '/:id/merchant', to: "merchants#show"
        get '/random', to: "random#show"
        get '/find', to: "find#show"
        get '/find_all', to: "find#index"
        get '/most_items', to: "most_items#index"
        get '/most_revenue', to: "most_revenue#index"
        get '/:id/best_day', to: "best_day#show"
      end

      namespace :merchants do
        get '/random', to: "random#show"
        get '/find', to: "find#show"
        get '/find_all', to: "find#index"
        get '/:id/items', to: "items#index"
        get '/:id/invoices', to: "invoices#index"
        get '/:id/revenue', to: "revenue#show"
        get '/most_items', to: "most_items#index"
        get '/:id/customers_with_pending_invoices', to: "invoices#show"
        get '/:id/favorite_customer', to: "customers#show"
        get '/revenue', to: "revenue#index"
        get '/most_revenue', to: "revenue#index"
      end

      namespace :transactions do
        get '/random', to: "random#show"
        get '/find', to: "find#show"
        get '/find_all', to: "find#index"
        get '/:id/invoice', to: "invoices#show"
      end

      resources :merchants, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :transactions, only: [:index, :show]
    end
  end
end
