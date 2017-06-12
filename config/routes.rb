Rails.application.routes.draw do

  get 'admins/index'

  get 'admins/show'

  get 'users/index'

  get 'users/show'

  devise_for :admins
  devise_for :users
  root 'top#index', controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
  }
   resources :users, :only => [:index, :show]
  resources :admins, :only => [:index, :show]
end
