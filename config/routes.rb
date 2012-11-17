TutorNetwork::Application.routes.draw do
  get "customer_homes/index_tutor_post/:page" => "customer_homes#index_tutor_post"
  get "customer_homes/show_tutor_post/:tutor_post_id" => "customer_homes#show_tutor_post"
  get "customer_homes/create_recipe/:tutor_id/:customer_id" => "customer_homes#create_recipe"

  # get "customer_homes_controller/create_recipe" => ""

  # get "customer_homes_controller/delete_recipe" => ""

  # The priority is based upon order of creation:
  # first created -> highest priority.

  get "tutor_homes/index_customer_post/:page" => "tutor_homes#index_customer_post"

  get "tutor_homes/show_customer_post/:customer_post_id" => "tutor_homes#show_customer_post"

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  devise_for :users do
    get "/", :to => "devise/sessions#new"
  end

  root :to => "devise/sessions#new"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
