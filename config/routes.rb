Rails.application.routes.draw do
  get 'login', to: 'sessions_controller#login', as: 'login_page'
  post 'login', to: 'sessions_controller#create', as: 'login'
  get 'leaderboard', to: 'users#leaderboard', as: 'leaderboard'
  get 'show/:id', to: 'users#show', as: 'show'
  get 'tickets/approve'
  get 'tickets/new'
  post 'tickets/changestatus'
  post 'tickets/create'
  get '/help', to: 'static_pages#help'
  root 'users#leaderboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
