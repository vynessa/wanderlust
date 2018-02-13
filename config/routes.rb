Rails.application.routes.draw do
  resources :trips
  devise_for :users
  root to: "welcome#index", as: "index"
end
