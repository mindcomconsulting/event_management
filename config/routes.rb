Rails.application.routes.draw do
  resources :feedbacks
  #devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  devise_for :users, controllers: {:registrations => "registrations",sessions: "sessions"}



  # You can have the root of your site routed with "root"
  root 'welcomes#home'
  get "/welcomes/user" => "welcomes#user", :as => "user"
  #get "/users/home" => "sessions#home", :as => "home"
  get "/welcomes/home" => "welcomes#home", :as => "home"

  get "/book_events/event_image" => "book_events#event_image"
  get "/book_events/view_event_detail" => "book_events#view_event_detail"
  get "/book_events/booking_history" => "book_events#booking_history", :as => "booking_history"
  get "/book_events/booking_status" => "book_events#booking_status", :as => "booking_status"
  get "/book_events/function_price" => "book_events#function_price", :as => "function_price"
  post "/book_events/create_events" => "book_events#create_events", :as => "create_events"
  get "/book_events/new_event" => "book_events#new_event", :as => "new_event"
  get "/book_events/event_details" => "book_events#event_details", :as => "event_details"
  resources :book_events, :only=>[:index,:new]


  get "/events/event_image" => "events#event_image", :as => "event_image"
  get "/events/view_event_detail" => "events#view_event_detail", :as => "view_event_detail"
  get "/events/view_booking" => "events#view_booking", :as => "view_booking"
  get "/events/update_booking" => "events#update_booking", :as => "update_booking"
  get "/events/new_booking" => "events#new_booking", :as => "new_booking"
  get "/events/venue_address" => "events#venue_address", :as => "venue_address"
  post "/events/create_event" => "events#create_event", :as => "create_event"
  get "/events/add_event" => "events#add_event", :as => "add_event"
  get "/events/event_detail" => "events#event_detail", :as => "event_detail"
  get "/events/add_venue" => "events#add_venue", :as => "add_venue"
  post "/events/create_venue" => "events#create_venue", :as => "create_venue"
  get "/events/venue" => "events#venue", :as => "venue"
  post "/events/create_price" => "events#create_price", :as => "create_price"
  get "/events/add_price" => "events#add_price", :as => "add_price"
  get "/events/price" => "events#price", :as => "price"
  post "/events/create_function" => "events#create_function", :as => "create_function"
  get "/events/function" => "events#function", :as => "function"
  get "/events/venue_detail" => "events#venue_detail", :as => "venue_detail"
  resources :events, :only=>[:index,:new]

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
