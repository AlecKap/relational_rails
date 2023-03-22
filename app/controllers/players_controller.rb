class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    # binding.pry
    @player = Player.find(params[:id])
  end
end