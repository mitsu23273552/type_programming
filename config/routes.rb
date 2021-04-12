Rails.application.routes.draw do
  devise_for :users
  root to: 'questions#index'
  resources :questions, only: [:index, :new, :create]
  resources :games, only: [:index, :create] do
    collection do
      get 'count', 'ranking'
    end
  end
end
