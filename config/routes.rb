Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :professionals, only: [ :new, :edit, :destroy, :show, :update ]

  resources :patients, only: [ :index, :new, :create, :show, :edit, :update ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
