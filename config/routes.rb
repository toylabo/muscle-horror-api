Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :results, only: [:index, :create, :show, :destroy]
  post "/login", to: 'users#create'
  get "/ranking", to: "ranking#index"
end
