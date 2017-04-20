Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  #User site
  resources :teams

  #Admin site
  namespace :admin do
    resources :teams
  end
end
