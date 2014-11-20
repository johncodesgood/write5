Rails.application.routes.draw do

  resources :articles
  resources :users

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  root 'welcome#index'

  post 'survey' => 'users#survey'

end
