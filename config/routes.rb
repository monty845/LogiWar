Rails.application.routes.draw do
  resources :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'accounts#home'
  post 'CreateAccount/create' => 'create_account#create'
  post 'Login/verify' => 'create_account#verify'

  get 'Logout' => 'create_account#logout'
  get 'CreateAccount' => 'create_account#start'
  get 'Login' => 'create_account#login'
  #get 'Login/' => 'create_account#login'
  get 'Accounts/' => 'accounts#all'
  get 'student_json' => 'create_account#student_json'
  post 'subscribe' => 'create_account#subscribe'
  get 'Profile' => 'create_account#profile'
  get 'Profile/edit' => 'create_account#edit'
  post 'update' => 'create_account#update'
  get 'All' => 'accounts#all2'
  get 'Game' => 'game#gameview'
  post 'place' => 'game#place'
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
