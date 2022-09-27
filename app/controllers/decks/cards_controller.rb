class Decks::CardsController < ApplicationController

  before_action :set_card, only: %i[show edit update destroy]
  before_action :set_deck
  # before_action :set_card, only: %i[show edit update destroy]

  def index
    @cards = Card.where(deck_id: @deck.id)
  end

  def show

  end

  def new
    @card = Card.new
  end

  def edit
  end

  def create
    @card = @deck.cards.new(card_params)
    @card.user = current_user

    respond_to do |format|
      if @card.save
        format.html { redirect_to deck_card_url(deck_id: @deck.id, id: @card.id), notice: "Card was successfully created." }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end/channel/UCB-rsRcOHnuCRFugLw7XUug

  end

  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to deck_card_url(deck_id: @deck.id, id: @card.id), notice: "Card was successfully updated." }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @card.destroy

    respond_to do |format|
      format.html { redirect_to cards_url, notice: "Card was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def game
    
  end

  private

    def set_deck
      @deck = Deck.find_by_code(params[:deck_code])
    end

    def card_params
      params.require(:card).permit(:question, :description)
    end

    def set_card
      @card = Card.find(params[:id])
    end
    
end