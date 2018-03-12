Rails.application.routes.draw do

  get 'pages/home'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
        sessions: 'users/sessions',
       passwords: 'users/passwords',
       registrations: 'users/registrations'
  }

  root 'welcome#index'


end
