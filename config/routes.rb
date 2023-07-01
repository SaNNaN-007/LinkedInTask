Rails.application.routes.draw do
  resources :users, only: [:index, :create, :show]
  post '/login', to: 'authentication#login'
  delete '/logout', to: 'authentication#logout'
end
