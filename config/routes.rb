Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
 
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get '/propertys' => 'propertys#index'
  get '/propertys/:id', to: 'propertys#show', as: :property
  get '/propertys/:id/edit', to: 'propertys#edit', as: :edit_property_path
  get 'propertys/new' => 'propertys#new', as: :new_property
  delete '/propertys/:id' => 'propertys#destroy'

  get '/bookings' => 'bookings#index'
  get '/bookings/:id', to: 'bookings#show', as: :booking
  get '/bookings/:id/edit', to: 'bookings#edit', as: :edit_booking_path
  delete '/bookings/:id' => 'bookings#destroy'

  get '/jobs' => 'jobs#index'
  get '/jobs/todays' => 'jobs#todays', as: :todays_jobs
  get '/jobs/emailview' => 'jobs#emailview', as: :email_view_jobs
  post '/jobs' => 'jobs#create'
  patch '/jobs/:id' => 'jobs#update'
  match '/jobs/:id/startjob' => 'jobs#startjob', :via => [:get], as: :startjob_job
  match '/jobs/:id/endjob' => 'jobs#endjob', :via => [:get], as: :endjob_job
  get '/jobs/new' => 'jobs#new', as: :new_job
  get '/jobs/:id', to: 'jobs#show', as: :job
  get '/jobs/:id/edit', to: 'jobs#edit', as: :edit_job_path
  delete '/jobs/:id' => 'jobs#destroy'



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
