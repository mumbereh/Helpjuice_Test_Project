Rails.application.routes.draw do
  resources :searches, only: [:index, :create]
  get '/analytics/top_searches', to: 'analytics#top_searches'
  
  root 'searches#index'
end
