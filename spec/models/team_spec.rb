require 'rails_helper'

RSpec.describe Team, type: :model do
  describe "relationships" do
    it { should have_many :players }
  end

  describe 'instance_methods' do
    before(:each) do
      @team_1 = Team.create!(name: 'Pittsburgh Penguins', city: 'Pittsburgh', position_in_standings: 2, stanley_cup: true) 
      @team_2 = Team.create!(name: 'Colorado Avalanche', city: 'Denver', position_in_standings: 1, stanley_cup: true) 
      @team_3 = Team.create!(name: 'Seattle Kraken', city: 'Seattle', position_in_standings: 3, stanley_cup: false) 
      @team_4 = Team.create!(name: 'Chicago Blackhawks', city: 'Chicago', position_in_standings: 4, stanley_cup: true) 
      @player_1 = @team_1.players.create!(name: 'Sidney Crosby', position: 'C', jersey_number: 87, stanley_cup: true)
      @player_1 = @team_1.players.create!(name: 'joe nhl', position: 'C', jersey_number: 67, stanley_cup: true)
      @player_2 = @team_4.players.create!(name: 'Patrick Kane', position: 'LW', jersey_number: 88, stanley_cup: true)
      @player_2 = @team_4.players.create!(name: 'Patrick Kane', position: 'LW', jersey_number: 88, stanley_cup: true)
      @player_3 = @team_2.players.create!(name: 'Nathan MacKinnon', position: 'C', jersey_number: 29, stanley_cup: true)
      @player_3 = @team_2.players.create!(name: 'Mikko Rantanen', position: 'RW', jersey_number: 29, stanley_cup: true)
      @player_4 = @team_3.players.create!(name: 'Matty Beniers', position: 'C', jersey_number: 10, stanley_cup: false )
      @player_4 = @team_3.players.create!(name: 'Mike guy', position: 'C', jersey_number: 10, stanley_cup: false )
    end

    it '::order_by_created_at' do
      expect(Team.order_by_created_at).to eq([@team_1, @team_2, @team_3, @team_4])
    end

    it '::counts_number_of_players' do
      expect(@team_1.num_of_players).to eq(2)
    end
  end
end
