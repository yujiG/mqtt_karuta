Rails.application.routes.draw do
  resources :games, only: %i[create] do
  end
  resources :users, only: %i[create]
end
