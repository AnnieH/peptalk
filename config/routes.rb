RailsPrelaunchSignup::Application.routes.draw do
  root :to => 'home#index'

  match '/auth/failure' => 'sessions#failure'

  match '/signout' => 'sessions#destroy', :as => :signout

  match '/signup' => 'sessions#new', :as => :signup

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
  resources :make_calls, :only => :index
  match ':controller(/:action(.:format))'
  match ':controller(/:action(/:id(.:format)))'
end
