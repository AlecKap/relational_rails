class Teams::PlayersController < ApplicationController
  def index
    @team = Team.find(params[:team_id])
    @players = @team.order_by_name(params)
  end

  def new
  end

  def create
    @team = Team.find(params[:team_id])
    @team.players.create!(player_params)
    redirect_to "/teams/#{@team.id}/players"
  end

  private
  def player_params
    params.permit(:name, :position, :jersey_number, :stanley_cup)
  end
end