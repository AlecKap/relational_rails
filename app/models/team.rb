class Team < ApplicationRecord
  has_many :players

  def self.order_by_created_at
    order(:created_at)
  end

  def num_of_players
    players.size
  end
end