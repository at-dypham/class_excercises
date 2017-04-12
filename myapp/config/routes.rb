Rails.application.routes.draw do
  get 'users/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :create, :update, :detroy] do
    resources :posts, only: [:index, :create]
    member do
    get 'recent_posts'
    end
    collection do
      get 'follow_users'
    end
    namespace :admin do
      resources :admin_users, only: [:index]
      resources :posts, only: [:index]
    end
  end
end
