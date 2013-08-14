Caltrain::Application.routes.draw do
  root :to => 'home#index'
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  get '/match/:id' => "trips#matching_offers", :as => "match_trip"
  get "home" =>"home#index"
  resources :users
  resources :sessions
  resources :offers
  resources :trips
  resources :shares


end
