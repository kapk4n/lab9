Rails.application.routes.draw do
  root 'example#input'
  get 'example/show'
  get '/example/show_db', as: 'show_db'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
