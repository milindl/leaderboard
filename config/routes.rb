Rails.application.routes.draw do
  get 'tickets/new'
  post 'tickets/create'
  get '/help', to: 'static_pages#help'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
