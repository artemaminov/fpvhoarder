Rails.application.routes.draw do
  root "home#index"
  post "/signin", to: "sessions#create"
  post "/logout", to: "sessions#destroy"
  post "/command/:command", to: "tg/command#send_to_tg"

  resource :user, path: :profile do
    resources :messages
  end
end
