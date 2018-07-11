Rails.application.routes.draw do
  get 'home/index'
  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	#
	root 'home#index'
	devise_for :users

	get 'switch/enable', :to => 'switch#enable'
	get 'switch/disable', :to => 'switch#disable'
end
