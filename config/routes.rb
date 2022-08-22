Rails.application.routes.draw do
  resources :requests
  #resources :units
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  ##########
  #rutas para hacer que el cliente encuentre la informacion
  resources :requests, path: :client
  resources :units, path: :uf
  # Defines the root path route ("/")
  # root "articles#index"
end
