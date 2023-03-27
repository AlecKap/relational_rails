require 'rails_helper'

RSpec.describe '/teams', type: :feature do
  describe 'as a visitor I visit the teams index page' do
     let!(:team_1) { Team.create!(name: 'Pittsburgh Penguins', city: 'Pittsburgh', position_in_standings: 2, stanley_cup: true, created_at: '2013-02-02 01:00:50') }
     let!(:team_2) { Team.create!(name: 'Colorado Avalanche', city: 'Denver', position_in_standings: 1, stanley_cup: true, created_at: '2013-02-02 01:00:10') }
     let!(:team_3) { Team.create!(name: 'Seattle Kraken', city: 'Seattle', position_in_standings: 3, stanley_cup: false, created_at: '2013-02-02 01:00:30') }
     let!(:team_4) { Team.create!(name: 'Chicago Blackhawks', city: 'Chicago', position_in_standings: 4, stanley_cup: true, created_at: '2013-02-02 01:00:20') }
     
    it 'displays the name of all the teams' do
      visit '/teams' 
      
      expect(page).to have_content(team_1.name)
      expect(page).to have_content(team_2.name)
      expect(page).to have_content(team_3.name)
      expect(page).to have_content(team_4.name)
    
    end
    
    it 'displays the name of all the teams in the order they were created' do
      visit '/teams'
      save_and_open_page
      
      expect(team_2.name).to appear_before(team_1.name)
      expect(page).to have_content(team_1.created_at)
      expect(page).to have_content(team_2.created_at)
      expect(page).to have_content(team_3.created_at)
      expect(page).to have_content(team_4.created_at)
    end

    it 'has a link to teams index page' do
      visit "/teams"

      click_on "Teams page"
      expect(current_path).to eq("/teams")
    end
    
    it 'has a link to players index page' do
      visit "/teams"

      click_on "Players page"
      expect(current_path).to eq("/players")
    end
  end
end