Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "tournaments#index"
  resources :teams
  resources :groups do
    member do
      post 'add' => 'tournament_teams#add'
    end
  end
  resources :matches do

  end
  resources :penalties
  resources :tournament_teams
  resources :tournaments do
    member do
      get 'schedule' => 'matches#schedule'
      get 'ranking' => 'tournament_teams#ranking'
    end
  end
end
