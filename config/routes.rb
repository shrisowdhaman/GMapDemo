TestingDemo::Application.routes.draw do
  #resources
  resources :posts do
    resources :comments
  end

  resources :books
  resources :user_sessions
  resources :users   
  resources :user_attributes
  resources :events do
      resources :event_photos
  end
  resources :password_resets

  root :to=>'posts#index'

  match 'signup' => 'users#new', :as => :signup
  match 'login' => "user_sessions#new",      :as => :login
  match 'logout' => "user_sessions#destroy", :as => :logout
  match 'myaccount' => 'users#show', :as=>:myaccount
 
  
end
