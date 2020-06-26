Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'root#root'

  get '/about', to: 'about#about'

  resources :articles, only: [:show, :index]
end
