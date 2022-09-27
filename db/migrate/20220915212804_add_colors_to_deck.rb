class AddColorsToDeck < ActiveRecord::Migration[6.1]
  def change
    add_column :decks, :font_color, :string
    add_column :decks, :deck_color, :string
  end
end
