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
    collection do
      patch 'add_score'
      patch 'update_score'
      patch 'add_time'
    end
  end
  resources :penalties
  resources :tournament_teams do
    member do
      put 'set_rank'
    end
  end
  resources :tournaments do
    member do
      get 'submit_matches'
      post 'submit'
      get 'quarterfinals' => 'matches#quarterfinals'
      get 'schedule' => 'matches#schedule'
      get 'ranking' => 'tournament_teams#ranking'
    end
  end
end
