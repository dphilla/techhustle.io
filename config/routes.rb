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

  #for calendar
  resources :events

  #for synergy requests
  resources :synergies, only: [:create, :index]

  get "/dashboard", to: "dashboard#index"
  get "/dashboard/analytics", to: "dashboard#show"

  #for twilio TwiML (see twilio phone number for details--using ngrok for local development)
  post "/inbound", to: 'twilio#index'
  get "/inbound", to: 'twilio#index'

end
