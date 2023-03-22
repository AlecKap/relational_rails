require 'rails_helper'

RSpec.describe '/players', type: :feature do
  describe 'as a visitor I visit the players index page' do
     let!(:team_1) { Team.create!(name: 'Pittsburgh Penguins', city: 'Pittsburgh', position_in_standings: 2, stanley_cup: true) }
     let!(:player_1) { team_1.players.create!(name: 'Sidney Crosby', position: 'C', jersey_number: 87, stanley_cup: true) }

    it 'displays the name of all the players and their attributes' do
      visit "/players/#{player_1.id}" 
      save_and_open_page

      expect(page).to have_content(player_1.name)
      expect(page).to have_content(player_1.position)
      expect(page).to have_content(player_1.jersey_number)
      expect(page).to have_content(player_1.stanley_cup)
    end
  end
end