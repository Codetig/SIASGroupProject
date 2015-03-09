Rails.application.routes.draw do

  root 'sites#index'

 resources :users do
  resources :buckets, shallow: true do
    resources :tracks, shallow: true 
  end
 end

 delete 'buckets/:bucket_id/tracks/:id' => 'tracks#destroy', as: :track_destroy
end
  
# commenting this out so that we are all using the sam routes
#JUST FOR NOW
  # root 'sites#index'
  # resources :buckets do
  #   resources :tracks do
  #   end
  # end
# =======
 #  get 'sites/index'


=begin
Prefix Verb   URI Pattern                              Controller#Action
     sites_index GET    /sites/index(.:format)                   sites#index
            root GET    /                                        sites#index
   bucket_tracks GET    /buckets/:bucket_id/tracks(.:format)     tracks#index
                 POST   /buckets/:bucket_id/tracks(.:format)     tracks#create
new_bucket_track GET    /buckets/:bucket_id/tracks/new(.:format) tracks#new
      edit_track GET    /tracks/:id/edit(.:format)               tracks#edit
           track GET    /tracks/:id(.:format)                    tracks#show
                 PATCH  /tracks/:id(.:format)                    tracks#update
                 PUT    /tracks/:id(.:format)                    tracks#update
                 DELETE /tracks/:id(.:format)                    tracks#destroy
    user_buckets GET    /users/:user_id/buckets(.:format)        buckets#index
                 POST   /users/:user_id/buckets(.:format)        buckets#create
 new_user_bucket GET    /users/:user_id/buckets/new(.:format)    buckets#new
     edit_bucket GET    /buckets/:id/edit(.:format)              buckets#edit
          bucket GET    /buckets/:id(.:format)                   buckets#show
                 PATCH  /buckets/:id(.:format)                   buckets#update
                 PUT    /buckets/:id(.:format)                   buckets#update
                 DELETE /buckets/:id(.:format)                   buckets#destroy
           users GET    /users(.:format)                         users#index
                 POST   /users(.:format)                         users#create
        new_user GET    /users/new(.:format)                     users#new
       edit_user GET    /users/:id/edit(.:format)                users#edit
            user GET    /users/:id(.:format)                     users#show
                 PATCH  /users/:id(.:format)                     users#update
                 PUT    /users/:id(.:format)                     users#update
                 DELETE /users/:id(.:format)                     users#destroy
=end




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
