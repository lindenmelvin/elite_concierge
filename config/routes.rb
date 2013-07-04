EliteConcierge::Application.routes.draw do

  resources :users

  namespace :api do
    resources :sessions, :path => 'user', :only => [:create, :destroy] do
      post '/login' => 'sessions#create', :on => :collection
      get '/logout' => 'sessions#destroy', :on => :collection
    end
    
    resources :service_requests
  end
  
  resources :service_requests
  
  devise_for :users, :path => '', :path_names => { :sign_in => 'login', :sign_out => 'logout' }
  as :user do
    get '/login' => 'sessions#new'
    get '/logout' => 'sessions#destroy'
  end
  
  root :to => 'users#index'
end
