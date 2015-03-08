Rails.application.routes.draw do
  root 'buckets#index'
  resources :buckets do
    resources :tracks do
    end
  end
end

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