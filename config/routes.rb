Rails.application.routes.draw do
  resources :trips do
    resources :activities
  end
  devise_for :users
  root to: "welcome#index", as: "index"
end
