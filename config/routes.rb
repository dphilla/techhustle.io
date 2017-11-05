Rails.application.routes.draw do

  root 'welcome#index'
  namespace :admin do
    resources :users, only: [:index]
  end

  resources :users, only: [:new, :create, :show]
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  #google oauth

  get "/auth/google_oauth2" #sends client id and secret to google
  get "/auth/google_oauth2/callback", to: "sessions#create"

  resources :connections do
    resources :interactions
    resources :notes, only: [:new, :create, :show, :index]
  end

  get "/dashboard", to: "dashboard#index"
  get "/dashboard/analytics", to: "dashboard#show"

end
