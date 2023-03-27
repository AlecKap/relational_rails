require 'rails_helper'

RSpec.describe '/teams/new' do
  describe 'When I am taken to /teams/new I see a form for a new parent record' do
    it 'I can create a new team' do
      visit "/teams"

      click_on "New Team"

      expect(current_path).to eq("/teams/new")
      fill_in 'Name', with: "Washington Capitals"
      fill_in 'City', with: "Washington"
      fill_in 'Position in Standings', with: "1"
      select 'Yes', from: "Stanley Cup"
      click_on "Create Team"
      
      expect(current_path).to eq('/teams')
      expect(page).to have_content("Washington Capitals")
    end
  end
end