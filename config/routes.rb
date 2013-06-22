EliteConcierge::Application.routes.draw do

  resources :users

  namespace :api do
    devise_for :users, :path => '', :path_names => { :sign_in => 'login', :sign_out => 'logout' }
    as :user do
      get '/login' => 'sessions#create'
      get '/logout' => 'sessions#destroy'
    end
  end
  
  devise_for :users, :path => '', :path_names => { :sign_in => 'login', :sign_out => 'logout' }
  as :user do
    get '/login' => 'sessions#new'
    get '/logout' => 'sessions#destroy'
  end
  
  root :to => 'users#index'
end
