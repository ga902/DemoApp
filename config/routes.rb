Rails.application.routes.draw do
  get 'users/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  resources :posts
  resources :comments
  get'/login',   to: 'sessions#login'
  post   '/login',   to: 'sessions#create'
  post '/createpost',to:'posts#create'
  post '/createcomment',to: 'comments#create'
  get '/logout',to:'sessions#destroy'
  root 'users#home'
end
