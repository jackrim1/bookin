Rails.application.routes.draw do


resources :messes do
    member do
      get 'join'
      get 'leave'
    end
  end

  resources :dashboard

  get 'contact/index'

  get 'pages/home'
  get 'about/index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
        sessions: 'users/sessions',
       passwords: 'users/passwords',
       registrations: 'users/registrations'
  }

  root 'welcome#index'


end
