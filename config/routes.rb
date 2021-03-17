Rails.application.routes.draw do
  root 'home#top'
  
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users
  
  resources :calendars
  get '/calendar/target', to: 'calendars#target'
  get '/calendar/targets', to: 'calendars#targets'
  get '/calendar/target/month', to: 'calendars#month'
  get '/calendar/learning', to: 'calendars#learning'
  post '/calendar/month', to: 'calendars#months'
end
