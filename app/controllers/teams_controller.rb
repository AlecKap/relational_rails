class TeamsController < ApplicationController
  def index
    @teams = Team.order_by_created_at
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
  end

  def create
    Team.create!(team_params)
    redirect_to '/teams'
  end

  private
  def team_params
    params.permit(:name, :city, :position_in_standings, :stanley_cup)
  end
end