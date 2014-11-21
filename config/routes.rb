Rails.application.routes.draw do

  resources :articles
  resources :users


  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  root 'welcome#index'

  post 'survey' => 'users#survey'

  get '/auth/:provider/callback' => 'sessionsfacebook#create'

  get '/signout' => 'sessionsfacebook#destroy', :as => :signout

  get '/signin' => 'sessionsfacebook#new', :as => :signin

end
