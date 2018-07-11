Rails.application.routes.draw do
  get 'home/index'
  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	#
	root 'home#index'
	devise_for :users, controllers: {
		sessions: 'users/sessions'
	}
  
	devise_scope :user do
		scope :users, as: :users do
			post 'pre_otp', to:'users/sessions#pre_otp'
		end
	end

end
