Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'home#index'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  resources :users
  resources :posts do 
  	resources :comments
  end	
end
