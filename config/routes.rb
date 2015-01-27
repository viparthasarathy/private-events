Rails.application.routes.draw do
  get  'signup' => 'users#new'
  get  'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  delete 'signout' => 'sessions#destroy'
  resources :users
  resources :events
  resources :invites
  root 'sessions#new'
end
