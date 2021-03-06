Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'articles#index'

  resource :timeline, only: [:show]
  #ひとり１つしかないので

  resource :profile, only: [:show, :edit, :update]

  resources :articles do
    resources :comments, only: [:index, :new, :create]
      resource :like, only: [:show,:create, :destroy]
  end

  resources :accounts, only: [:show] do 
    resources :follows, only: [:index,:show,:create]
    resources :followings, only: [:index]
    resources :unfollows, only: [:create]
  end

  resources :favorites, only: [:index]  

end
