Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root 'static_pages#top'
  get 'privacy', to: 'static_pages#privacy'
  get 'terms', to: 'static_pages#terms'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :users
  resources :boards, shallow: true do
    resources :comments, only: %i[create destroy]
    resource :favorites, only: %i[create destroy]
  end
  resources :password_resets, only: %i[new create edit update]
  resource :profile, only: %i[show edit update destroy]
  resources :contacts, only: %i[create new]
end
