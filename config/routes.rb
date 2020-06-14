Rails.application.routes.draw do
  resources :games, only: %i[create]
  get 'games/:game_key/:user_key', to: 'games#show'
  resources :users, only: %i[create]
end
