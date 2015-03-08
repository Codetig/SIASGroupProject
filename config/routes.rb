Rails.application.routes.draw do
# <<<<<<< HEAD
#JUST FOR NOW
  root 'sites#index'
  resources :buckets do
    resources :tracks do
    end
  end
# =======
 #  get 'sites/index'

 #  root 'sites#index'

 # resources :users do
 #  resources :buckets, shallow: true do
 #    resources :tracks, shallow: true 
 #  end
# end
end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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



# root_path GET / buckets#index

# buckets_path  GET /buckets(.:format)  buckets#index
# POST  /buckets(.:format)  buckets#create
# new_bucket_path GET /buckets/new(.:format)  buckets#new
# edit_bucket_path  GET /buckets/:id/edit(.:format) buckets#edit
# bucket_path GET /buckets/:id(.:format)  buckets#show
# PATCH /buckets/:id(.:format)  buckets#update
# PUT /buckets/:id(.:format)  buckets#update
# DELETE  /buckets/:id(.:format)  buckets#destroy

# POST  /buckets/:bucket_id/tracks(.:format)  tracks#create
# PATCH /buckets/:bucket_id/tracks/:id(.:format)  tracks#update
# PUT /buckets/:bucket_id/tracks/:id(.:format)  tracks#update
# DELETE  /buckets/:bucket_id/tracks/:id(.:format)  tracks#destroy
