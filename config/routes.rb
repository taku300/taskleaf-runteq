Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root 'static_pages#top'
  resources :users, only: %i[new create update]
  resources :boards do
    resources :comments, only: %i[create update destroy], shallow: true
    get 'bookmarks', on: :collection
  end
  resources :bookmarks, only: %i[create destroy]
  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'
  resources :users do
    collection do
      get 'search'
    end
  end
  resource :profile, only: %i[show edit update]
  resources :password_resets, only: [:new, :create, :edit, :update]
  namespace :admin do
    root to: 'dashboards#index'
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    delete 'logout', to: 'user_sessions#destroy'
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :boards, only: [:index, :show, :edit, :update, :destroy]
  end
end
