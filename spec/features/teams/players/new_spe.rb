require 'rails_helper'

RSpec.describe '/teams/:team_id/players/new' do
  describe 'When I am taken to /teams/:team_id/players/new I see a form for a new player record' do
    before(:each) do
      @team_1 = Team.create!(name: 'Pittsburgh Penguins', city: 'Pittsburgh', position_in_standings: 2, stanley_cup: true) 
    end

    it 'I can create a new player' do
      visit "/teams/#{@team_1.id}/players"
      expect(page).to_not have_content("Alec Kapicak")

      click_on "Create Player"

      expect(current_path).to eq("/teams/#{@team_1.id}/players/new")
      fill_in 'Name', with: "Alec Kapicak"
      fill_in 'Position', with: "C"
      fill_in 'Jersey Number', with: "12"
      select 'Yes', from: "Stanley Cup"
      click_on "Create New Player"
      
      expect(current_path).to eq("/teams/#{@team_1.id}/players")
      expect(page).to have_content("Alec Kapicak")
    end
  end
end