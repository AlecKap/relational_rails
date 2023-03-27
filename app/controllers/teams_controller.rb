class TeamsController < ApplicationController
  def index
    @teams = Team.order_by_created_at
  end

  def show
    @team = Team.find(params[:id])
   
  end
end