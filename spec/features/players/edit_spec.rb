require 'rails_helper'

RSpec.describe '/players/:id/edit' do
  describe 'When I am taken to /players/:id/edit I see a form to update the player attributes' do
    before(:each) do
      @team_1 = Team.create!(name: 'Pittsburgh Penguins', city: 'Pittsburgh', position_in_standings: 2, stanley_cup: true) 
      @player_1 = @team_1.players.create!(name: 'Sidney Crosby', position: 'C', jersey_number: 87, stanley_cup: true)
    end

    it 'I can update a player information' do
      visit "/players/#{@player_1.id}"
      expect(page).to have_content("Sidney Crosby")
      expect(page).to_not have_content("Jake Kapicak")
      
      click_on "Update Player Information"
      expect(current_path).to eq("/players/#{@player_1.id}/edit")
      fill_in 'Update Name', with: "Jake Kapicak"
      fill_in 'Update Position', with: "LW"
      fill_in 'Update Jersey Number', with: "77"
      select 'No', from: "Stanley Cup"
      click_on "submit updates to player"
      
      
      expect(current_path).to eq("/players/#{@player_1.id}")
      expect(page).to have_content("Jake Kapicak")
    end
  end
end