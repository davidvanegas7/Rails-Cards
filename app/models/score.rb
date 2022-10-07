# == Schema Information
#
# Table name: scores
#
#  id         :bigint           not null, primary key
#  card_id    :bigint           not null
#  user_id    :bigint           not null
#  sum_total  :integer
#  plays      :integer
#  prom       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Score < ApplicationRecord
  belongs_to :card
  belongs_to :user
end
