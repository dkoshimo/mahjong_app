Rails.application.routes.draw do
  get '/' => 'home#top'
  get "/login" => "users#login_form"
  post '/login' => 'users#login'
  post '/logout' => 'users#logout'
  get '/new' => 'users#new'
  post '/users/create' => 'users#create'

  get '/index/:id' => 'posts#index'
  get '/index/:id/edit' => 'posts#edit'
  post '/index/:id/update' => 'posts#update'
  post '/index/:id/destroy' => 'posts#destroy'


  get '/result/:id' => 'posts#result'
  post '/score/:id/create' => 'posts#score_create'
  
  get '/score/:id/edit' => 'posts#edit_score'
  get '/score/:id/update' => 'posts#update_score'
  
  get '/game' => 'posts#game'
  post '/game/create' => 'posts#game_create'
  
  get '/game/:id' => 'posts#show'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
