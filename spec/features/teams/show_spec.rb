require 'rails_helper'

RSpec.describe '/teams/:id', type: :feature do
  describe 'as a visitor I visit team show page' do
    before(:each) do
      @team_1 = Team.create!(name: 'Pittsburgh Penguins', city: 'Pittsburgh', position_in_standings: 2, stanley_cup: true) 
      @team_2 = Team.create!(name: 'Colorado Avalanche', city: 'Denver', position_in_standings: 1, stanley_cup: true) 
      @team_3 = Team.create!(name: 'Seattle Kraken', city: 'Seattle', position_in_standings: 3, stanley_cup: false) 
      @team_4 = Team.create!(name: 'Chicago Blackhawks', city: 'Chicago', position_in_standings: 4, stanley_cup: true) 
      @player_1 = @team_1.players.create!(name: 'Sidney Crosby', position: 'C', jersey_number: 87, stanley_cup: true)
      @player_2 = @team_4.players.create!(name: 'Patrick Kane', position: 'LW', jersey_number: 88, stanley_cup: true)
      @player_3 = @team_2.players.create!(name: 'Nathan MacKinnon', position: 'C', jersey_number: 29, stanley_cup: true)
      @player_4 = @team_3.players.create!(name: 'Matty Beniers', position: 'C', jersey_number: 10, stanley_cup: false )
    end
   
    it 'displays the team with that id including its attributes' do
     
      visit "/teams/#{@team_1.id}"
      expect(page).to have_content(@team_1.name)
      expect(page).to have_content("Home City: #{@team_1.city}")
      expect(page).to have_content("Position In Standings: #{@team_1.position_in_standings}")
      expect(page).to have_content("Has Won the Stanley Cup: #{@team_1.stanley_cup}")
      
      visit "/teams/#{@team_2.id}"
      expect(page).to have_content(@team_2.name)
      expect(page).to have_content("Home City: #{@team_2.city}")
      expect(page).to have_content("Position In Standings: #{@team_2.position_in_standings}")
      expect(page).to have_content("Has Won the Stanley Cup: #{@team_2.stanley_cup}")
    end
    
    it 'displays a count of the number of player associated with this team' do
      visit "/teams/#{@team_2.id}"
      save_and_open_page
      expect(page).to have_content("Number of Players: #{@team_2.num_of_players}")
    end

    it 'has a link to players index page' do
      visit "/teams/#{@team_2.id}"

      click_on "Players page"
      expect(current_path).to eq("/players")
    end

    it 'has a link to teams index page' do
      visit "/teams/#{@team_2.id}"

      click_on "Teams page"
      expect(current_path).to eq("/teams")
    end

    it 'has a link to this teams players' do
      visit "teams/#{@team_1.id}"
save_and_open_page
      click_on "Player Roster"

      expect(current_path).to eq("/teams/#{@team_1.id}/players")
    end
  end
end