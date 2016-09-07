Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :customers do
        get '/random', to: "random#show"
        get '/find', to: "find#show"
        get '/find_all', to: "find#index"
        get '/:id/invoices', to: "invoices#index"
        get '/:id/transactions', to: "credit_card_transactions#index"
      end

      namespace :invoice_items do
        get '/random', to: "random#show"
        get '/find', to: "find#show"
        get '/find_all', to: "find#index"
      end

      namespace :invoices do
        get '/random', to: "random#show"
        get '/find', to: "find#show"
        get '/find_all', to: "find#index"
      end

      namespace :items do
        get '/random', to: "random#show"
        get '/find', to: "find#show"
        get '/find_all', to: "find#index"
      end

      namespace :merchants do
        get '/random', to: "random#show"
        get '/find', to: "find#show"
        get '/find_all', to: "find#index"
        get '/:id/items', to: "items#index"
        get '/:id/invoices', to: "invoices#index"
      end

      namespace :credit_card_transactions do
        get '/random', to: "random#show"
        get '/find', to: "find#show"
        get '/find_all', to: "find#index"
        get '/:id/invoices', to: "invoices#index"
      end

      resources :merchants, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :credit_card_transactions, only: [:index, :show]
    end
  end
end
