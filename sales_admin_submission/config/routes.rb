Rails.application.routes.draw do
  resources :data, only: [:index]
end
