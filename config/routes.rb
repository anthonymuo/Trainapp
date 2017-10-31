Rails.application.routes.draw do
  
  get 'tickets/index'

  get 'tickets/new'

  get 'users/new'

  root 'homepage#index';
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 resources :users
 resources :tickets


end
