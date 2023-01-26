Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/songs', to:'songs#index'
  get '/songs/:id', to: 'songs#show'
  get '/artists/:artist_id/songs', to: 'artist_songs#index' #how could we do this before having an artists controller?
  get '/artists', to: 'artists#index'
  get '/artists/new', to: 'artists#new'

  post '/artists', to: 'artists#create'

  get '/artists/:id/edit', to: 'artists#edit'

  patch '/artists/:id', to: 'artists#update'
  
end
