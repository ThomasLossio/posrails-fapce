Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	namespace :api do
	  	namespace :v1 do
	  		get "hello", to: "products#hello_world"
	  		get "products", to: "products#list"
	  		get "products/:id", to: "products#find"
	  		post "products", to:"products#create"
	  		delete "products/:id", to:"products#destroy"
	  		put "products/:id", to:"products#update"
		end
	end	
end
