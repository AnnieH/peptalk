RailsPrelaunchSignup::Application.routes.draw do
  root :to => 'home#index'

  match '/auth/failure' => 'sessions#failure'

  match '/signout' => 'sessions#destroy', :as => :signout

  match '/signin' => 'sessions#new', :as => :signin

  match '/auth/:provider/callback' => 'sessions#create'

  authenticated :user do
    root :to => 'home#index'
  end
 
  devise_for :users, :controllers => { :registrations => "registrations", :confirmations => "confirmations" }
  
  devise_scope :user do
    root :to => "devise/registrations#new"
    match '/user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
  end

  match 'users/bulk_invite/:quantity' => 'users#bulk_invite', :via => :get, :as => :bulk_invite
  resources :users do
    get 'invite', :on => :member
  end
end
