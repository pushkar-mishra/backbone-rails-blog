Rails.application.routes.draw do

  root "pages#home"

  resources :posts

  resources :users, except: [:new]
  
  get '/register', to: "users#new"
  
  get '/login', to: "logins#new"
  post '/login', to: "logins#create"
  get '/logout', to: "logins#distroy"

end
