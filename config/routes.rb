Rails.application.routes.draw do
  resources :restaurants do
    collection do #collection : Utilisé pour des routes qui s'appliquent à toute la collection (sans ID de ressource individuelle).
      get :top
    end
    member do #member : Utilisé pour des routes qui s'appliquent à une instance spécifique de la collection (avec ID de ressource individuelle).
      get :chef
    end
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [:edit, :update, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
