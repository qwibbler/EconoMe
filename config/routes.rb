Rails.application.routes.draw do
  devise_for :users
  resources :entity_groups
  resources :groups
  resources :entities
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "splash#home"
end
