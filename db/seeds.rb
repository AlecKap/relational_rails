# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Team.destroy_all
Player.destroy_all

@team_1 = Team.create!(name: 'Pittsburgh Penguins', city: 'Pittsburgh', position_in_standings: 2, stanley_cup: true) 
@team_2 = Team.create!(name: 'Colorado Avalanche', city: 'Denver', position_in_standings: 1, stanley_cup: true) 
@team_3 = Team.create!(name: 'Seattle Kraken', city: 'Seattle', position_in_standings: 3, stanley_cup: false) 
@team_4 = Team.create!(name: 'Chicago Blackhawks', city: 'Chicago', position_in_standings: 4, stanley_cup: true) 
@player_1 = @team_1.players.create!(name: 'Sidney Crosby', position: 'C', jersey_number: 87, stanley_cup: true)
@player_2 = @team_1.players.create!(name: 'joe nhl', position: 'C', jersey_number: 67, stanley_cup: true)
@player_3 = @team_4.players.create!(name: 'Patrick Kane', position: 'LW', jersey_number: 88, stanley_cup: true)
@player_4 = @team_4.players.create!(name: 'Patrick Kane', position: 'LW', jersey_number: 88, stanley_cup: true)
@player_5 = @team_2.players.create!(name: 'Nathan MacKinnon', position: 'C', jersey_number: 29, stanley_cup: true)
@player_6 = @team_2.players.create!(name: 'Mikko Rantanen', position: 'RW', jersey_number: 29, stanley_cup: true)
@player_7 = @team_3.players.create!(name: 'Matty Beniers', position: 'C', jersey_number: 10, stanley_cup: false )
@player_8 = @team_3.players.create!(name: 'Mike guy', position: 'C', jersey_number: 10, stanley_cup: false)