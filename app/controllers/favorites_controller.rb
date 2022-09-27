class FavoritesController < ApplicationController

  before_action :authenticate_user! 

  before_action :set_deck, only: %i[ create destroy ]

  def index
    favorites = Favorite.where(user_id: current_user).pluck(:deck_id)
    @decks = Deck.find(favorites)
  end

  def create
    Favorite.create(deck: @deck, user: current_user)
    redirect_to deck_url(@deck)
  end

  def destroy
    @deck.favorites.find_by(user: current_user).destroy
    redirect_to deck_url(@deck)
  end

  private

    def set_deck
      @deck = Deck.find(params[:deck_id])
    end

end