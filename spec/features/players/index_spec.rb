require 'rails_helper'

RSpec.describe '/players', type: :feature do
  describe 'as a visitor I visit the players index page' do
    before(:each) do 
      @team_1 = Team.create!(name: 'Pittsburgh Penguins', city: 'Pittsburgh', position_in_standings: 2, stanley_cup: true)
      @team_2 = Team.create!(name: 'Colorado Avalanche', city: 'Denver', position_in_standings: 1, stanley_cup: true)
      @team_3 = Team.create!(name: 'Seattle Kraken', city: 'Seattle', position_in_standings: 3, stanley_cup: false)
      @team_4 = Team.create!(name: 'Chicago Blackhawks', city: 'Chicago', position_in_standings: 4, stanley_cup: true)
      @player_1 = @team_1.players.create!(name: 'Sidney Crosby', position: 'C', jersey_number: 87, stanley_cup: true)
      @player_2 = @team_1.players.create!(name: 'Cammy Granatto', position: 'C', jersey_number: 67, stanley_cup: false)
      @player_3 = @team_4.players.create!(name: 'Patrick Kane', position: 'LW', jersey_number: 88, stanley_cup: true)
      @player_4 = @team_4.players.create!(name: 'Sarah Nurse', position: 'LW', jersey_number: 97, stanley_cup: false)
      @player_5 = @team_2.players.create!(name: 'Nathan MacKinnon', position: 'C', jersey_number: 29, stanley_cup: true)
      @player_6 = @team_2.players.create!(name: 'Mikko Rantanen', position: 'RW', jersey_number: 21, stanley_cup: true)
      @player_7 = @team_3.players.create!(name: 'Matty Beniers', position: 'C', jersey_number: 10, stanley_cup: false )
      @player_8 = @team_3.players.create!(name: 'Leah Hextall', position: 'C', jersey_number: 13, stanley_cup: true )
    end

    it 'displays only the name of players and their attributes who have won the stanley cup' do
      visit '/players' 
      save_and_open_page

      expect(page).to have_content(@player_1.name)
      expect(page).to have_content(@player_1.position)
      expect(page).to have_content(@player_1.jersey_number)
      expect(page).to have_content(@player_1.stanley_cup)

      expect(page).to have_content(@player_3.name)
      expect(page).to have_content(@player_3.position)
      expect(page).to have_content(@player_3.jersey_number)
      expect(page).to have_content(@player_3.stanley_cup)

      expect(page).to have_content(@player_5.name)
      expect(page).to have_content(@player_5.position)
      expect(page).to have_content(@player_5.jersey_number)
      expect(page).to have_content(@player_5.stanley_cup)
      
      expect(page).to have_content(@player_6.name)
      expect(page).to have_content(@player_6.position)
      expect(page).to have_content(@player_6.jersey_number)
      expect(page).to have_content(@player_6.stanley_cup)

      expect(page).to have_content(@player_8.name)
      expect(page).to have_content(@player_8.position)
      expect(page).to have_content(@player_8.jersey_number)
      expect(page).to have_content(@player_8.stanley_cup)

      expect(page).to_not have_content(@player_2.name)
      expect(page).to_not have_content(@player_4.name)
      expect(page).to_not have_content(@player_7.name)
    end

    it 'has a link to players index page' do
      visit "/players"

      click_on "Players page"
      expect(current_path).to eq("/players")
    end

    it 'has a link to teams index page' do
      visit "/players"

      click_on "Teams page"
      expect(current_path).to eq("/teams")
    end

    it 'has links to edit players ' do
      visit "/players"
      
      click_on "Edit #{@player_1.name}"


      expect(current_path).to eq("/players/#{@player_1.id}/edit")
    end
  end
end