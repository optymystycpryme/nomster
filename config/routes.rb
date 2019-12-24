Rails.application.routes.draw do
  root 'places#index'
  resources :places
  get '/search' => 'places#search', :as => 'search_places'
end
