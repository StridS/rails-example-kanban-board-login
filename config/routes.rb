Rails.application.routes.draw do
  devise_for :users

  mount LetterOpenerWeb::Engine, at: "/letter_opener" 
  resources :boards do
    resources :cards
  end
  root 'boards#index'
end
