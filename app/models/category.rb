# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Category < ApplicationRecord
    has_many :decks

    validates :name, :description, presence: true
    validates :name, uniqueness: { case_insensitive: false }
end
 