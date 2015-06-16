Rails.application.routes.draw do
  devise_for :users
  resources :blog_posts

  get 'project/index'

	match "/about", to: "about#index", :via => 'get'
	match "/project", to: "project#index", :via => 'get'
	match "/project/list", to: "project#getProjects", :via => 'get'
	match "/get_contacts", to: "contact#get_contacts", :via => 'post'
	
	get "/contact", to: redirect('/#contact', status: 301)
	
	resources :contact
	
	
	
  resources :blog_posts, :path => 'blog'
	# we want to do the tags here, I know we should have had another controller
	# but my inexperience with mongo made it difficult
	match "/blog/tag/:tag", to: "blog_posts#getPostsbyTag", :via => 'get'

  get 'home/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
