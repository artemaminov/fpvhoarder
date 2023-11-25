Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  post "/command/:command", to: "tg/command#send_to_tg"
  resources :messages
  post "/signup", to: "users#create"
end
