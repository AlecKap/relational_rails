require 'rails_helper'

RSpec.describe '/teams/:id/edit' do
  describe 'When I am taken to /teams/:id/edit I see a form to update the team attributes' do
    before(:each) do
      @team_1 = Team.create!(name: 'Pittsburgh Penguins', city: 'Pittsburgh', position_in_standings: 2, stanley_cup: true) 
    end

    it 'I can update a team' do
      visit "/teams/#{@team_1.id}"
      expect(page).to_not have_content("Minnesota Wild")
      
      click_on "Update Team"
      expect(current_path).to eq("/teams/#{@team_1.id}/edit")
      fill_in 'Update Name', with: "Minnesota Wild"
      fill_in 'Update City', with: "St. Paul"
      fill_in 'Update Position in Standings', with: "2"
      select 'No', from: "Stanley Cup"
      click_on "submit updates to team"
      save_and_open_page
      
      expect(current_path).to eq("/teams/#{@team_1.id}")
      expect(page).to have_content("Minnesota Wild")
    end
  end
end