require 'rails_helper'

RSpec.describe '/players', type: :feature do
  describe 'as a visitor when I visit the players index page' do
    before(:each) do
      @team_1 = Team.create!(name: 'Pittsburgh Penguins', city: 'Pittsburgh', position_in_standings: 2, stanley_cup: true)
      @player_1 = @team_1.players.create!(name: 'Sidney Crosby', position: 'C', jersey_number: 87, stanley_cup: true)
    end
    
    it 'displays the name of all the players and their attributes' do
      visit "/players/#{@player_1.id}" 
    

      expect(page).to have_content(@player_1.name)
      expect(page).to have_content(@player_1.position)
      expect(page).to have_content(@player_1.jersey_number)
      expect(page).to have_content(@player_1.stanley_cup)
    end

    it 'has a link to players index page' do
      visit "/players/#{@player_1.id}"

      click_on "Players page"
      expect(current_path).to eq("/players")
    end

    it 'has a link to teams index page' do
      visit "/players/#{@player_1.id}"

      click_on "Teams page"
      expect(current_path).to eq("/teams")
    end

    it 'has a link to update player' do
      visit "/players/#{@player_1.id}"
      click_on "Update Player Information"
      save_and_open_page
      expect(current_path).to eq("/players/#{@player_1.id}/edit")
    end
  end
end