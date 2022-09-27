# == Schema Information
#
# Table name: accounts
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  username   :string
#  nickname   :string
#  birth      :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Account < ApplicationRecord
  
  belongs_to :user

  has_one_attached :avatar

  validates :username, :nickname, :birth, presence: true

end
