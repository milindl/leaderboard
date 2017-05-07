Rails.application.routes.draw do
  get 'tickets/new'

  get 'tickets/view'

  get 'tickets/leaderboard'
  post 'tickets/create'
  get '/help', to: 'static_pages#help'
  root 'tickets#leaderboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
