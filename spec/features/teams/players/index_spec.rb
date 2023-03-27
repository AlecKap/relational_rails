require 'rails_helper'

RSpec.describe '/teams/:team_id/players', type: :feature do
  describe 'as a visitor when i visit the teams/players index page' do
    let!(:team_1) { Team.create!(name: 'Pittsburgh Penguins', city: 'Pittsburgh', position_in_standings: 2, stanley_cup: true) }
    let!(:team_2) { Team.create!(name: 'Colorado Avalanche', city: 'Denver', position_in_standings: 1, stanley_cup: true) }
    let!(:team_3) { Team.create!(name: 'Seattle Kraken', city: 'Seattle', position_in_standings: 3, stanley_cup: false) }
    let!(:team_4) { Team.create!(name: 'Chicago Blackhawks', city: 'Chicago', position_in_standings: 4, stanley_cup: true) }

    let!(:player_1) { team_1.players.create!(name: 'Sidney Crosby', position: 'C', jersey_number: 87, stanley_cup: true)}
    let!(:player_2) { team_1.players.create!(name: 'Evengi Malkin', position: 'RW', jersey_number: 71, stanley_cup: true)}
    let!(:player_3) { team_4.players.create!(name: 'Patrick Kane', position: 'LW', jersey_number: 88, stanley_cup: true)}
    let!(:player_4) { team_4.players.create!(name: 'Jonathan Toews', position: 'C', jersey_number: 19, stanley_cup: true)}
    let!(:player_5) { team_2.players.create!(name: 'Nathan MacKinnon', position: 'C', jersey_number: 29, stanley_cup: true)}
    let!(:player_6) { team_2.players.create!(name: 'Gabriel Landeskog', position: 'C', jersey_number: 92, stanley_cup: true)}
    let!(:player_7) { team_3.players.create!(name: 'Matty Beniers', position: 'C', jersey_number: 10, stanley_cup: false )}

    it 'displays each associated player and thier attributes' do
      visit "/teams/#{team_1.id}/players"
      save_and_open_page

      expect(page).to have_content(player_1.name)
      expect(page).to have_content(player_1.position)
      expect(page).to have_content(player_1.jersey_number)
      expect(page).to have_content(player_1.stanley_cup)

      expect(page).to have_content(player_2.name)
      expect(page).to have_content(player_2.position)
      expect(page).to have_content(player_2.jersey_number)
      expect(page).to have_content(player_2.stanley_cup)
    end
  end
end