Caltrain::Application.routes.draw do  root :to => 'trips#index'
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  resources :users
  resources :sessions
  resources :offers
  resources :trips


end
