Rails.application.routes.draw do
  devise_for :users
  resources :trips do
    resources :activities
    resources :budget_items
  end
  root to: "welcome#index", as: "index"
end
