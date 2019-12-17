Rails.application.routes.draw do
  get  '/login',  to: 'sessions#new'     # show login form
  post '/login',  to: 'sessions#create'  # process login
  get  '/logout', to: 'sessions#destroy' # process logout
    
  resources :boards do
    resources :cards
  end
  root 'boards#index'
end
