# == Schema Information
#
# Table name: favorites
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  deck_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Favorite < ApplicationRecord

  # add_index :favorites, [:user_id, :deck_id], unique: true
  validates :user, uniqueness: { scope: :deck }


  belongs_to :user
  belongs_to :deck
end
