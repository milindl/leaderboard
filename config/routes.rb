Rails.application.routes.draw do
  get 'users/leaderboard'
  get 'show/:id', to: 'users#show', as: 'show'
  get 'tickets/new'
  post 'tickets/create'
  get '/help', to: 'static_pages#help'
  root 'users#leaderboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
