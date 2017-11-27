Rails.application.routes.draw do

  resources :reports, only: [ :get_consults, :get_diagnosis, :show, :index ]

  root to: 'patients#index'

  get 'soaps/new'

  get 'soaps/create'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  mount Attachinary::Engine => "/attachinary"
  root to: 'pages#home'

  resources :users, only: [:index]
  root to: 'users#index'

  resources :patients, except: [ :destroy ] do
    resources :consults, only: [ :new, :create, :edit ]
    get 'new_with_soap', to: 'consults#new_with_soap'
  end

  get 'list_consults_by_date', to: 'consults#list_consults_by_date'

  resources :consults, only: [ :index, :show, :edit, :update ] do
    resources :soaps, only: [ :new, :create, :edit, :update ]
  end

  resources :soaps, only: [ :destroy ]

  resources :professionals, only: [ :new, :edit, :destroy, :show, :update ]
end
