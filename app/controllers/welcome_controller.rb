class WelcomeController < ApplicationController

  def index
    if !current_user.nil?
      redirect_to decks_url
    end
  end
end
