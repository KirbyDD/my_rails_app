Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: "welcome#index"

  get '/users/new', to: "users#new"
  post "/users", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  get "/animes", to: "animes#index"
  get "/animes/:name", to: "animes#show"
end
