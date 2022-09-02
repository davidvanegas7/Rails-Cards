# == Schema Information
#
# Table name: decks
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  category_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  owner_id    :bigint           not null
#
class Deck < ApplicationRecord
  belongs_to :category
  belongs_to :owner, class_name: "User"
  has_many :cards

  validates :name, :description, presence: true
  validates :name, uniqueness: { case_insensitive: false }
end
