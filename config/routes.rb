Caltrain::Application.routes.draw do
  resources :trips


  resources :users

  root :to => 'users#index'


end
