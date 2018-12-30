Rails.application.routes.draw do
  devise_for :users

  authenticate :user do
    get 'welcome/index'
    get 'welcome/dev_index'

    get 'accounts/due' => 'bookings#invoices', as: :to_invoice

    root 'welcome#dev_index'
    get '/bookings/todays' => 'bookings#todays', as: :todays_bookings
    get '/bookings/emailview' => 'bookings#emailview', as: :email_view_bookings
    get '/bookings/quotes' => 'bookings#quotes', as: :quote_bookings
    get '/bookings/invoices' => 'bookings#invoices', as: :invoice_bookings

    resources :tasks, :customers, :locations, :bookings

    post 'bookings/:id/start_work' => 'bookings#start_work', as: :start_work
    post 'bookings/:id/end_work' => 'bookings#end_work', as: :end_work

  end
end
