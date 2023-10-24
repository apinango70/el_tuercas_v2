Rails.application.routes.draw do
  resources :vehicles
  get 'admin/create_user'
  get 'admin/edit_user'
  get 'admin/show_user'
  root 'pages#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # root "articles#index"
  # Permisos del admin
  resources :admin, only: [:index, :new, :create, :update]
  # Ruta para crear usuarios
  post 'admin/create', to: 'admin#create', as: 'admin_create'

end
