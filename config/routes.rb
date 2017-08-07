Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
  }
  root 'entries#index'
  resources :admins, only: [:index, :show]
  resources :groups, except: [:show, :destroy] do
    resources :messages, except: [:show]
  end
  resources :users, only: [:index, :show] do
    collection {get "search"}
    resources :entries, only: [:index]
  end
  resources :entries, only: [:index, :show, :new, :create, :edit] do
    collection {get "search"}
  end
end
