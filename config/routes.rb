Rails.application.routes.draw do

  root to: redirect('/login')

  get 'login' => 'sessions#new'
  post 'create' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  delete 'logout' => 'sessions#destroy'

  get 'sales/agreement/new' => 'agreement#new' # as create_new_agreement
  post'sales/agreement/new' => 'agreement#create'
  get 'sales/agreement/:user_id/channel'=> 'channel#edit' # as create_new_channel
  post 'sales/agreement/:user_id/channel' => 'channel#save_channel'
  get 'sales/agreement/:user_id/info'=> 'agreement#sales_success_create' # display merchant details to send mail


  get 'sales/list_merchant' => 'sales#list_merchant' # as sales dashboard
  post 'merchant/send-mail/:merchant_id' => 'merchant#send_mail'


  get 'merchant/new/:hash' => 'user#merchant_set_password' # as merchant_dashboard
  post 'merchant/new/:hash' => 'user#merchant_set_password' # as merchant_dashboard
  #merchant form
  get 'merchant/info/general' => 'merchant#edit_general'
  post 'merchant/info/general' => 'merchant#edit_general'
  get 'merchant/info/pic' => 'merchant#edit_pic'
  post 'merchant/info/pic' => 'merchant#edit_pic'
  get 'merchant/info/owner' => 'merchant#edit_owner'
  post 'merchant/info/owner' => 'merchant#edit_owner'
  get 'merchant/info/cs' => 'merchant#edit_customer_support'
  post 'merchant/info/cs' => 'merchant#edit_customer_support'
  get 'merchant/info/operational' => 'merchant#edit_operational'
  post 'merchant/info/operational' => 'merchant#edit_operational'
  get 'merchant/info/bank' => 'merchant#edit_bank_account'
  post 'merchant/info/bank' => 'merchant#edit_bank_account'

  get 'merchant/document' => 'document#index' # as merchant_document
  post 'merchant/document' => 'document#upload'
  get 'merchant/document/download' => 'document#download'

  get 'merchant/terms' => 'term#index' # as merchant_terms
  get 'sales/document/:agreement_id' => 'term#sales_download'
  get 'doc' => 'term#doc'
  post 'merchant/terms' => 'term#agree'

  get 'merchant/details/:merchant_id' => 'agreement#merchant_details'
  post 'merchant/details/:merchant_id' => 'agreement#upload'

  get 'merchant/details/:merchant_id/document' => 'agreement#merchant_details_document'

  get 'merchant/details/:merchant_id/change/:haft' => 'agreement#change_price'
  post 'merchant/details/:merchant_id/change/:haft' => 'agreement#custom_price'

  get 'merchant/finish' => 'merchant#finish'

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
