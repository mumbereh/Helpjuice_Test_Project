Rails.application.routes.draw do
  root 'search#index'
  post 'search', to: 'search#create'
  get 'analytics', to: 'search#analytics'
end