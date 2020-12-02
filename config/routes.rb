Rails.application.routes.draw do
  devise_for :users
  #resources :items 
  #resources :users, only: :create
  root to: "items#index"
end
