Rails.application.routes.draw do
  # resources :cards
  devise_for :users
  resources :categories
  # resources :decks
  resources :decks do 
    resources :cards, controller: "decks/cards"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'welcome#index'

end
