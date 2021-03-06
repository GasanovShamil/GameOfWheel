Rails.application.routes.draw do
  root 'home#index'
  resources :rooms do
	get 'participate', :on => :member
	get 'showmyrooms', :on => :member
  end
  resources :prizes
  resources :categories

 # devise_for :users
  devise_for :users, :controllers => { :sessions => "custom_sessions" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
