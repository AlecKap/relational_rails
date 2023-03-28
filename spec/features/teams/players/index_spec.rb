require 'rails_helper'

RSpec.describe '/teams/:team_id/players', type: :feature do
  describe 'as a visitor when i visit the teams/players index page' do
    before(:each) do
      @team_1 = Team.create!(name: 'Pittsburgh Penguins', city: 'Pittsburgh', position_in_standings: 2, stanley_cup: true) 
      @team_2 = Team.create!(name: 'Colorado Avalanche', city: 'Denver', position_in_standings: 1, stanley_cup: true) 
      @team_3 = Team.create!(name: 'Seattle Kraken', city: 'Seattle', position_in_standings: 3, stanley_cup: false) 
      @team_4 = Team.create!(name: 'Chicago Blackhawks', city: 'Chicago', position_in_standings: 4, stanley_cup: true) 
      @player_1 = @team_1.players.create!(name: 'Sidney Crosby', position: 'C', jersey_number: 87, stanley_cup: true)
      @player_2 = @team_1.players.create!(name: 'joe nhl', position: 'C', jersey_number: 67, stanley_cup: true)
      @player_3 = @team_4.players.create!(name: 'Patrick Kane', position: 'LW', jersey_number: 88, stanley_cup: true)
      @player_4 = @team_4.players.create!(name: 'Patrick Kane', position: 'LW', jersey_number: 88, stanley_cup: true)
      @player_5 = @team_2.players.create!(name: 'Nathan MacKinnon', position: 'C', jersey_number: 29, stanley_cup: true)
      @player_6 = @team_2.players.create!(name: 'Mikko Rantanen', position: 'RW', jersey_number: 29, stanley_cup: true)
      @player_7 = @team_3.players.create!(name: 'Matty Beniers', position: 'C', jersey_number: 10, stanley_cup: false )
      @player_8 = @team_3.players.create!(name: 'Mike guy', position: 'C', jersey_number: 10, stanley_cup: false )
      @player_9 = @team_2.players.create!(name: 'Cale Makar', position: 'RD', jersey_number: 8, stanley_cup: true)
    end

    it 'displays each associated player and thier attributes' do
      visit "/teams/#{@team_1.id}/players"

      expect(page).to have_content(@player_1.name)
      expect(page).to have_content(@player_1.position)
      expect(page).to have_content(@player_1.jersey_number)
      expect(page).to have_content(@player_1.stanley_cup)

      expect(page).to have_content(@player_2.name)
      expect(page).to have_content(@player_2.position)
      expect(page).to have_content(@player_2.jersey_number)
      expect(page).to have_content(@player_2.stanley_cup)
    end

    it 'has a link to players index page' do
      visit "/teams/#{@team_1.id}/players"

      click_on "Players page"
      expect(current_path).to eq("/players")
    end

    it 'has a link to teams index page' do
      visit "/teams/#{@team_1.id}/players"

      click_on "Teams page"
      expect(current_path).to eq("/teams")
    end

    it 'has link to create player' do
      visit "/teams/#{@team_1.id}/players"
      
      click_on "Create Player"

      expect(current_path).to eq("/teams/#{@team_1.id}/players/new")
    end

    it 'has links to edit players ' do
      visit "/teams/#{@team_1.id}/players"
      
      click_on "Edit #{@player_1.name}"

      expect(current_path).to eq("/players/#{@player_1.id}/edit")
    end
    
    it 'has a link to sort players in alphabetical order' do
      visit "/teams/#{@team_2.id}/players"
      click_on "Sort Players Alphabetically"
      save_and_open_page
  
      expect(current_path).to eq("/teams/#{@team_2.id}/players")
      expect(@player_9.name).to appear_before(@player_6.name)
      expect(@player_9.name).to appear_before(@player_5.name)
      expect(@player_6.name).to appear_before(@player_5.name)
    end
  end

end