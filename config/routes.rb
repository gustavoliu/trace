Rails.application.routes.draw do
  get 'soaps/new'

  get 'soaps/create'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  mount Attachinary::Engine => "/attachinary"
  root to: 'pages#home'

  resources :users, only: [:index]
  root to: 'users#index'

  resources :patients, except: [ :destroy ] do
    resources :consults, only: [ :new, :create, :edit ]
  end

   resources :consults, only: [ :index, :show, :edit, :update ] do
    resources :soaps, only: [ :new, :create, :edit, :update ]
  end

  resources :professionals, only: [ :new, :edit, :destroy, :show, :update ]
end
