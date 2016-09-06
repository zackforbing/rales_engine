Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :customers do
        get '/random', to: "random#show"
        get '/find', to: "find#show"
        get '/find_all', to: "find#index"
      end

      namespace :invoice_items do
        resources :invoices, only: [:show]
        resources :items, only: [:show]
        get '/random', to: "random#show"
        get '/find', to: "find#show"
        get '/find_all', to: "find#index"
      end

      namespace :invoices do
        resources :customer, only: [:show]
        resources :invoice_items, only: [:index]
        resources :items, only: [:index]
        resources :merchant, only: [:show]
        resources :transactions, only: [:index]
        get '/random', to: "random#show"
        get '/find', to: "find#show"
        get '/find_all', to: "find#index"
      end

      namespace :items do
        resources :invoice_items, only: [:index]
        resources :merchants, only: [:show]
        get '/random', to: "random#show"
        get '/find', to: "find#show"
        get '/find_all', to: "find#index"
      end

      namespace :merchants do
        get '/random', to: "random#show"
        get '/find', to: "find#show"
        get '/find_all', to: "find#index"
      end

      namespace :transactions do
        get '/random', to: "random#show"
        get '/find', to: "find#show"
        get '/find_all', to: "find#index"
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


# api/v1/merchants/find/:id(.:format)
# api/v1/merchants/find_all(.:format)
