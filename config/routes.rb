Rails.application.routes.draw do

  root to: redirect('/login')

  get 'login' => 'sessions#new'
  post 'create' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  delete 'logout' => 'sessions#destroy'

  get 'sales/agreement/new' => 'agreement#new' # as create_new_agreement
  post'sales/agreement/new' => 'agreement#create'
  get 'sales/agreement/:user_id/channel'=> 'agreement#newchannel' # as create_new_channel
  get 'sales/agreement/:user_id/info'=> 'agreement#sales_success_create' # display merchant details to send mail
  post 'sales/agreement/:user_id/channel' => 'agreement#channeling'

  get 'sales/list_merchant' => 'sales#list_merchant' # as sales dashboard

  post 'merchant/send-mail/:merchant_id' => 'merchant#send_mail'


  get 'merchant/new/:hash' => 'user#merchant_set_password' # as merchant_dashboard
  post 'merchant/new/:hash' => 'user#merchant_set_password' # as merchant_dashboard
  get 'merchant/form' => 'merchantform#edit' # as merchant_form
  post 'merchant/form' => 'merchantform#update'

  get 'merchant/document' => 'document#index' # as merchant_document
  post 'merchant/document' => 'document#upload'
  get 'merchant/document/download' => 'document#download'

  get 'merchant/terms' => 'term#index' # as merchant_terms
  post 'merchant/terms' => 'term#agree'

  get 'merchant/details/:merchant_id' => 'agreement#merchant_details'

  get 'merchant/details/:merchant_id/change/:haft' => 'agreement#change_price'
  post 'merchant/details/:merchant_id/change/:haft' => 'agreement#custom_price'

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
end
