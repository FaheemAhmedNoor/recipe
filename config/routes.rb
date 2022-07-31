Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/home', to: 'pages#home'
  root 'pages#home'

  # get 'recipees', to: 'recipees#index'
  # get 'recipees/new', to: 'recipees#new', as: 'new_recipee'
  # post 'recipees', to: 'recipees#create'
  # get 'recipees/:id/edit', to: 'recipees#edit', as: 'edit_recipee'
  # patch 'recipees/:id', to: 'recipees/update'
  # get 'recipees/:id', to: 'recipees#show', as: 'recipee'
  # delete 'recipees/:id', to: 'recipees#destroy'

  resources :recipees

end
