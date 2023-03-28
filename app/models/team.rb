class Team < ApplicationRecord
  has_many :players, dependent: :destroy

  def self.order_by_created_at
    order(:created_at)
  end

  def num_of_players
    players.size
  end

  def order_by_name(params)
    if params[:order] != nil
      players.order(params[:order])
    else
      players
    end
  end
end