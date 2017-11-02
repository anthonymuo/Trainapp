Rails.application.routes.draw do
  
  get 'tickets/index'

  get 'tickets/new'

  get 'users/new'

  root 'homepage#index';
  get '/locate'            , to: 'homepage#locate'
  get '/contact'            , to: 'homepage#contact'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 resources :users
 resources :tickets


end
