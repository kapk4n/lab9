Rails.application.routes.draw do
  root 'sessions#new'
  post 'sessions/edit'
  delete 'sessions/destroy'


  # get "sign_in", to: "sessions#new"
  # post "sign_in", to: "sessions#create"
  # delete "logout", to: "sessions#destroy"

  resources :users
  get 'example/input'
  get 'example/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
