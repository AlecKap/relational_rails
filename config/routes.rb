Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/teams', to: 'teams#index'
  get '/teams/new', to: 'teams#new'
  post '/teams', to: 'teams#create'
  get '/teams/:team_id/players/new', to: 'teams/players#new'
  post '/teams/:team_id/players/new', to: 'teams/players#create'
  get '/teams/:id', to: 'teams#show'
  get '/teams/:id/edit', to: 'teams#edit'
  patch '/teams/:id', to: 'teams#update'
  get '/players', to: 'players#index'
  get '/players/:id', to: 'players#show'
  get '/teams/:team_id/players', to: 'teams/players#index'
end
