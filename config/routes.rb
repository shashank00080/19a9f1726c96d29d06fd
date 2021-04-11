Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
  	namespace :robot do
  		post ':id/orders', to: 'orders#create'
  	end
  end

end
