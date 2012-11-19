TutorNetwork::Application.routes.draw do
  get "customer_homes/index_tutor_post/:page" => "customer_homes#index_tutor_post"
  get "customer_homes/index_recipe/:page" => "customer_homes#index_recipe"
  get "customer_homes/show_tutor_post/:tutor_post_id" => "customer_homes#show_tutor_post"
  get "customer_homes/create_recipe/:tutor_id" => "customer_homes#create_recipe"
  get "customer_homes/show_recipe/:recipe_id" => "customer_homes#show_recipe"
  get "customer_homes/delete_recipe/:recipe_id" => "customer_homes#delete_recipe"

  get "customer_posts/index_customer_post/:page" => "customer_posts#index_customer_post"
  get "customer_posts/new_customer_post" => "customer_posts#new_customer_post"
  get "customer_posts/edit_customer_post/:customer_post_id" => "customer_posts#edit_customer_post"
  post "customer_posts/create_customer_post/" => "customer_posts#create_customer_post"
  post "customer_posts/delete_customer_post/:customer_post_id" => "customer_posts#delete_customer_post"
  post "customer_posts/update_customer_post/:customer_post_id" => "customer_posts#update_customer_post"
  get "customer_posts/index_recipe/:page" => "customer_posts#index_recipe"
  get "customer_posts/show_customer_post/:customer_post_id" => "customer_posts#show_customer_post"
  get "customer_posts/show_recipe/:recipe_id" => "customer_posts#show_recipe"
  get "customer_posts/accept_recipe/:recipe_id" => "customer_posts#accept_recipe"
  get "customer_posts/deny_recipe/:recipe_id" => "customer_posts#deny_recipe"

  # get "customer_homes_controller/create_recipe" => ""

  # get "customer_homes_controller/delete_recipe" => ""

  # The priority is based upon order of creation:
  # first created -> highest priority.

  get "tutor_homes/index_customer_post/:page" => "tutor_homes#index_customer_post"
  get "tutor_homes/index_recipe/:page" => "tutor_homes#index_recipe"
  get "tutor_homes/show_customer_post/:customer_post_id" => "tutor_homes#show_customer_post"
  get "tutor_homes/create_recipe/:customer_id" => "tutor_homes#create_recipe"
  get "tutor_homes/show_recipe/:recipe_id" => "tutor_homes#show_recipe"
  get "tutor_homes/delete_recipe/:recipe_id" => "tutor_homes#delete_recipe"

  get "tutor_posts/index_tutor_post/:page" => "tutor_posts#index_tutor_post"
  get "tutor_posts/new_tutor_post" => "tutor_posts#new_tutor_post"
  get "tutor_posts/edit_tutor_post/:tutor_post_id" => "tutor_posts#edit_tutor_post"
  post "tutor_posts/create_tutor_post/" => "tutor_posts#create_tutor_post"
  post "tutor_posts/delete_tutor_post/:tutor_post_id" => "tutor_posts#delete_tutor_post"
  post "tutor_posts/update_tutor_post/:tutor_post_id" => "tutor_posts#update_tutor_post"
  get "tutor_posts/index_recipe/:page" => "tutor_posts#index_recipe"
  get "tutor_posts/show_tutor_post/:tutor_post_id" => "tutor_posts#show_tutor_post"
  get "tutor_posts/show_recipe/:recipe_id" => "tutor_posts#show_recipe"
  get "tutor_posts/accept_recipe/:recipe_id" => "tutor_posts#accept_recipe"
  get "tutor_posts/deny_recipe/:recipe_id" => "customer_posts#deny_recipe"

  get "users/index/:page" => "users#index"
  get "users/show/:user_id" => "users#show"
  get "users/new" => "users#new"
  post "users/create" => "users#create"
  post "users/update/:user_id" => "users#update"
  get "users/edit/:user_id" => "users#edit"
  post "users/delete/:user_id" => "users#delete"

  get "/faq" => "etcs#faq"
  get "/contact" => "etcs#contact"

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
