require 'rails_helper'

RSpec.describe '/teams', type: :feature do
  describe 'as a visitor i visit the teams index page' do
     let!(:team_1) { Team.create!(name: 'Pittsburgh Penguins', city: 'Pittsburgh', position_in_standings: 2, stanley_cup: true) }
     let!(:team_2) { Team.create!(name: 'Colorado Avalanche', city: 'Denver', position_in_standings: 1, stanley_cup: true) }
     let!(:team_3) { Team.create!(name: 'Seattle Kraken', city: 'Seattle', position_in_standings: 3, stanley_cup: false) }
     let!(:team_4) { Team.create!(name: 'Chicago Blackhawks', city: 'Chicago', position_in_standings: 4, stanley_cup: true) }
     
    it 'displays the name of all the teams' do
      visit '/teams' 
    save_and_open_page
      expect(page).to have_content(team_1.name)
      expect(page).to have_content(team_2.name)
      expect(page).to have_content(team_3.name)
      expect(page).to have_content(team_4.name)
      
    end
  end
end