Rails.application.routes.draw do

  resources :users
  get '/login', to: "session#new"
  post '/login', to: "session#create"
  delete '/login', to: "session#destroy"
  root 'welcome#index'
end
