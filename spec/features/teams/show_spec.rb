require 'rails_helper'

RSpec.describe '/teams/:id', type: :feature do
  describe 'as a visitor I visit team show page' do
    let!(:team_1) { Team.create!(name: 'Pittsburgh Penguins', city: 'Pittsburgh', position_in_standings: 2, stanley_cup: true) }
    let!(:team_2) { Team.create!(name: 'Colorado Avalanche', city: 'Denver', position_in_standings: 1, stanley_cup: true) }
    let!(:team_3) { Team.create!(name: 'Seattle Kraken', city: 'Seattle', position_in_standings: 3, stanley_cup: false) }
    let!(:team_4) { Team.create!(name: 'Chicago Blackhawks', city: 'Chicago', position_in_standings: 4, stanley_cup: true) }

    it 'displays the team with that id including its attributes' do
      visit "/teams/#{team_1.id}"
      save_and_open_page
      expect(page).to have_content(team_1.name)
      expect(page).to have_content(team_1.city)
      expect(page).to have_content(team_1.position_in_standings)
      expect(page).to have_content(team_1.stanley_cup)
    end
  end
end