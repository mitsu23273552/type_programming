Rails.application.routes.draw do
  devise_for :users
  root to: 'questions#index'
  resources :questions do
    member do
      get 'user'
    end
  end

  resources :games, only: [:index, :create] do
    collection do
      get 'count', 'ranking'
    end
  end
end
