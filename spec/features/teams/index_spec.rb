require 'rails_helper'

RSpec.describe '/teams', type: :feature do
  describe 'as a visitor I visit the teams index page' do
    before(:each) do
      @team_1 = Team.create!(name: 'Pittsburgh Penguins', city: 'Pittsburgh', position_in_standings: 2, stanley_cup: true, created_at: '2013-02-02 01:00:50')
      @team_2 = Team.create!(name: 'Colorado Avalanche', city: 'Denver', position_in_standings: 1, stanley_cup: true, created_at: '2013-02-02 01:00:10')
      @team_3 = Team.create!(name: 'Seattle Kraken', city: 'Seattle', position_in_standings: 3, stanley_cup: false, created_at: '2013-02-02 01:00:30')
      @team_4 = Team.create!(name: 'Chicago Blackhawks', city: 'Chicago', position_in_standings: 4, stanley_cup: true, created_at: '2013-02-02 01:00:20')
      
      @player_1 = @team_1.players.create!(name: 'Sidney Crosby', position: 'C', jersey_number: 87, stanley_cup: true)
      @player_1 = @team_1.players.create!(name: 'joe nhl', position: 'C', jersey_number: 67, stanley_cup: true)
      @player_2 = @team_4.players.create!(name: 'Patrick Kane', position: 'LW', jersey_number: 88, stanley_cup: true)
      @player_2 = @team_4.players.create!(name: 'Patrick Kane', position: 'LW', jersey_number: 88, stanley_cup: true)
      @player_3 = @team_2.players.create!(name: 'Nathan MacKinnon', position: 'C', jersey_number: 29, stanley_cup: true)
      @player_3 = @team_2.players.create!(name: 'Mikko Rantanen', position: 'RW', jersey_number: 29, stanley_cup: true)
      @player_4 = @team_3.players.create!(name: 'Matty Beniers', position: 'C', jersey_number: 10, stanley_cup: false )
      @player_4 = @team_3.players.create!(name: 'Mike guy', position: 'C', jersey_number: 10, stanley_cup: false )
    end

    it 'displays the name of all the teams' do
      visit '/teams' 
      
      expect(page).to have_content(@team_1.name)
      expect(page).to have_content(@team_2.name)
      expect(page).to have_content(@team_3.name)
      expect(page).to have_content(@team_4.name)
    
    end
    
    it 'displays the name of all the teams in the order they were created' do
      visit '/teams'
      
      expect(@team_2.name).to appear_before(@team_1.name)
      expect(page).to have_content(@team_1.created_at)
      expect(page).to have_content(@team_2.created_at)
      expect(page).to have_content(@team_3.created_at)
      expect(page).to have_content(@team_4.created_at)
    end
    
    it 'has a link to teams index page' do
      visit "/teams"
      
      click_on "Teams page"
      expect(current_path).to eq("/teams")
    end
    
    it 'has a link to players index page' do
      visit "/teams"
      
      click_on "Players page"
      expect(current_path).to eq("/players")
    end
    
    it 'has link to new team page' do
      visit "/teams"
      
      click_on "New Team"
      expect(current_path).to eq("/teams/new")
    end

    it 'has link to edit team' do
      visit "/teams"
      
      click_on "Edit #{@team_1.name}"
      expect(current_path).to eq("/teams/#{@team_1.id}/edit")
    end
    
    it 'I see a link to delete the team' do
      visit "/teams"
      
      expect(page).to have_content(@team_1.name)
      
      click_on "Delete #{@team_1.name}"
      
      save_and_open_page
      expect(page).to_not have_content(@team_1.name)
      expect(current_path).to eq("/teams")
    end
  end
end