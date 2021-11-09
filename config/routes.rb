Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root 'static_pages#top'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :users
  resources :boards do
    resources :comments, only: %i[create destroy], shallow: true
    resource :favorites, only: %i[create destroy]
  end
  resources :password_resets, only: %i[new create edit update]
end
