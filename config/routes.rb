Caltrain::Application.routes.draw do  root :to => 'users#index'
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  resources :users
  resources :sessions

  root :to => "trips#index"

end
