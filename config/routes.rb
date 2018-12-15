Rails.application.routes.draw do
	resources :users, only: [:index, :edit, :update]
end
