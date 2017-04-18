Rails.application.routes.draw do
  devise_for :users

  get '/bookings/todays' => 'bookings#todays', as: :todays_bookings
  get '/bookings/emailview' => 'bookings#emailview', as: :email_view_bookings
  get '/bookings/quotes' => 'bookings#quotes', as: :quote_bookings
  get '/bookings/invoices' => 'bookings#invoices', as: :invoice_bookings

  resources :tasks, :customers, :locations, :bookings, :invoices, :cases

  get 'welcome/index'
  get 'welcome/dev_index'

  root 'welcome#dev_index'

  get '/jobs' => 'jobs#index'
  get '/jobs/todays' => 'jobs#todays', as: :todays_jobs
  get '/jobs/emailview' => 'jobs#emailview', as: :email_view_jobs
  post '/jobs' => 'jobs#create'
  patch '/jobs/:id' => 'jobs#update'
  get '/jobs/new' => 'jobs#new', as: :new_job
  get '/jobs/:id', to: 'jobs#show', as: :job
  get '/jobs/:id/edit', to: 'jobs#edit', as: :edit_job_path
  delete '/jobs/:id' => 'jobs#destroy'

  match '/bookings/:id/startjob' => 'bookings#startjob', :via => [:get], as: :startjob_booking
  match '/bookings/:id/endjob' => 'bookings#endjob', :via => [:get], as: :endjob_booking
end
