class AddCodeToDeck < ActiveRecord::Migration[6.1]
  def change
    add_column :decks, :code, :string
  end
end
