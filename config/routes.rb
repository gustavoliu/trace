Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  mount Attachinary::Engine => "/attachinary"
  root to: 'pages#home'

  resources :patients, except: [ :destroy ] do
    resources :consults, only: [ :new, :create ]
  end
  
  resources :professionals, only: [ :new, :edit, :destroy, :show, :update ]
end
