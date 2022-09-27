Rails.application.routes.draw do

  devise_for :users

  resources :favorites, only: %i[ index create destroy ], param: :deck_id

  resources :categories

  resources :accounts, only: %i[ show edit update destroy ]

  resources :decks, param: :code do

    resources :cards, controller: "decks/cards"

    get '/game' => "decks#game"

  end

  root 'welcome#index'

  get '/user' => "decks#index", :as => :user_root
  
end