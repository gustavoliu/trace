Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  devise_for :users
  root to: 'pages#home'

  resources :patients, except: [ :destroy ] do
    resources :consults, only: [ :new, :create ]
  end
  
  resources :professionals, only: [ :new, :edit, :destroy, :show, :update ]

end
