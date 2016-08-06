Rails.application.routes.draw do
  root to: 'data#index'
  resources :data, only: [:index, :create]
end
