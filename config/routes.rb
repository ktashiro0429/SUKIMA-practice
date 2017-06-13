Rails.application.routes.draw do

  get 'entries/index'

  get 'entries/show'

  get 'entries/new'

  get 'entries/edit'

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

  resources :groups, except: [:show, :destroy] do
    resources :messages, only: [:index, :create]
  end

  resources :users, :only => [:index, :show]
  resources :admins, :only => [:index, :show]
  
  resources :users do
    collection {get "search"}
    resources :entries, only:[:index]
  end

  resources :ariticles
  resources :entries
end
