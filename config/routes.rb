# frozen_string_literal: true

require_relative '../lib/route_scoper'
require 'sidekiq/web'

Rails.application.routes.draw do

  resources :estimator_types, only: [:show, :create]
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  get 'admin/contracts_approved' => 'admin/contracts#approved'
  get 'admin/contracts_archive' => 'admin/contracts#archive'
  post 'admin/assigns/:contract_id/assign_item/' => 'admin/assigns#assign_item'

  get 'admin/assigns/:contract_id' => 'admin/assigns#show'
  delete 'admin/assigns/:contract_id' => 'admin/assigns#destroy'
  put 'admin/assigns/:id' => 'admin/assigns#update_equipment'
  get 'admin/pending_team' => 'admin/contracts#pending_team'
  get 'admin/approved_team' => 'admin/contracts#approved_team'
  get 'admin/archive_team' => 'admin/contracts#archive_team'
  get 'admin/errors/error_404' => 'admin/errors#error_404'
  get 'admin/errors/no_perm' => 'admin/errors#no_perm'
  get 'admin/estimators_approved' => 'admin/estimators#estimators_approved'
  get 'admin/estimators_finished' => 'admin/estimators#estimators_finished'
  get 'admin/estimators_archive' => 'admin/estimators#estimators_archive'
  get 'admin/estimators/:id/status_change' => 'admin/estimators#status_change'
  get 'admin/estimator_types/:id/add_field' => 'admin/estimator_types#add_field'
  get 'admin/estimator_types/:id/edit_field/:id_field' => 'admin/estimator_types#edit_field', as: :edit_field
  get 'admin/estimator_types/:id/update_field/:id_field' => 'admin/estimator_types#update_field', as: :update_admin_field
  get 'admin/estimator_types/:id/destroy_field/:id_field' => 'admin/estimator_types#destroy_field'
  get 'admin/estimator_types/:id/export' => 'admin/estimator_types#export', as: :admin_export_estimator_type
  get 'admin/estimator_types_import' => 'admin/estimator_types#estimator_types_import', as: :admin_import_estimators_types
  post 'admin/estimator_types_import' => 'admin/estimator_types#estimator_types_import', as: :admin_import_estimators_types_post
  # get 'admin/tasks/invoices' => 'admin/tasks#invoices', as: :admin_invoices
  # get 'admin/tasks/download' => 'admin/tasks#download', as: :admin_invoices_download

  get 'admin/users/:id/edit_role' => 'admin/users#edit_role', as: :admin_user_edit_role
  patch 'admin/users/:id/update_role' => 'admin/users#update_role', as: :admin_user_update_role

  namespace :admin do
    resources :contracts do
      collection do
        get :popup_new
        post :popup_create
      end
      member do
        get :popup_edit
        patch :popup_update
      end
    end
    resources :roles

    resources :tasks, only: [] do
      collection do
        resources :invoices, only: [:index] do
          member do
            post :pay
            post :unpay
            get :history
            get :invoice_report
          end
          collection do
            get :archive
            get :download
          end
        end
      end
    end
  end

  resources :contracts, only: :create
  post "/sortable/reorder", to: "sortable#reorder"
  # scope RouteScoper.root do
  devise_for :users, controllers: {sessions: 'custom_sessions'}
  devise_scope :user do
    authenticated :user do
      root 'welcome#index'
    end
    unauthenticated do
      root 'devise/sessions#new'
    end
  end
  get 'accept_task' => 'welcome#accept_task'
  get 'accept_line' => 'welcome#accept_line'
  get 'email' => 'welcome#email'
  get 'cities' => 'welcome#cities'
  get 'attachments/:id' => 'welcome#attachments'
  get 'categories' => 'welcome#categories'
  get 'properties' => 'welcome#properties'
  get 'sign_in_for_api' => 'welcome#sign_in_for_api'
  get 'quick_books_integrations/callback' => 'quick_books_integrations#callback'
  get 'quick_books_integrations/' => 'quick_books_integrations#index'

  # root to: 'admin/users#index'
  # as :user do
  #   get 'users/profile', :to => 'devise/passwords#new', :as => :user_root
  # end

  namespace :admin do
    get '' => 'users#index'
    mount Sidekiq::Web => '/sidekiq'
    get 'tasks/moderation' => 'tasks#moderation'
    get 'tasks/:id/delete_document/:document' => 'tasks#delete_document'
    resources :users
    resources :tasks do
      put 'change_status' => 'tasks#change_status', as: :change_status
    end
    resources :equipment
    resources :vehicles, shallow: true do
      resources :maintenances, only: %i[index create update destroy]
    end
    resources :estimator_types
    resources :estimators
    resources :countries
    resources :task_payments
    resources :complaints
    resources :categories
    resources :contracts
    resources :work_zones
    resources :project_tasks
    resources :line_tasks
    resources :permissions
    resource :item_line_dv
    resources :settings, only: %i[index edit update settings_estimator], id: /[^\/]+/
    get 'new_change_status/:id' => 'contracts#new_change_status', as: :new_change_status
    resources :cash_out_payments do
      get 'transaction' => 'cash_out_payments#transaction'
    end
    get 'tracker' => 'users#tracker'
    get 'settings_estimator' => 'settings#settings_estimator'
    get 'settings_chs' => 'settings#settings_chs'
    get 'time_tracker' => 'users#time_tracker', as: :time_tracker
    get 'estimator_types/:id/display_views/:id_dv' => 'estimator_types#display_views', as: :estimator_types_display_views


    get 'get_user_data' => 'test#test'
  end

  namespace :api do
    post 'notifications/device' => 'feed_notifications#add_device'

    get 'users/hire_suggestions' => 'task_suggestions#hire_suggestions'
    get 'users/concierge_suggestions' => 'task_suggestions#concierge_suggestions'

    post 'users/up_balance' => 'users/up_balance'

    post 'users/me' => 'users#me_update'
    post 'users/reset_password' => 'users#reset_password'
    get 'users/me' => 'users#me'
    get 'users/token_active' => 'users#token_active'
    get 'users/:id' => 'users#show'
    get 'contractors' => 'users#contractors'
    devise_scope :user do
      post 'users/sign_in' => 'sessions#create'
    end
    # post 'users/sign_in' => 'users#sign_in'
    post 'users/sign_up' => 'users#sign_up'
    delete 'users/sign_out' => 'sessions#destroy'
    post 'users/update_description' => 'users#update_description'

    post 'tasks' => 'tasks#create'
    match 'location' => 'locations#create', via: %w[get post]
    delete 'tasks/:id' => 'tasks#destroy'
    post 'tasks/:id' => 'tasks#update'
    get 'tasks/cities' => 'tasks#cities'

    get 'tasks/concierge/active' => 'tasks#tasks_concierge_active'
    get 'tasks/concierge/archive' => 'tasks#tasks_concierge_archive'
    get 'tasks/concierge/pending' => 'tasks#tasks_concierge_pending'
    get 'tasks/concierge/available' => 'tasks#tasks_concierge_available'
    post 'tasks/:id/confirm/' => 'tasks#confirm_task'

    get 'tasks/my' => 'tasks#my_tasks'
    get 'tasks/hire' => 'tasks#tasks_hire'
    get 'tasks/hire/past' => 'tasks#tasks_hire_past'
    get 'tasks/hire/posted' => 'tasks#tasks_hire_posted'
    get 'tasks/hire/carrent' => 'tasks#tasks_hire_carrent'

    get 'tasks/:id' => 'tasks#show'

    get 'countries' => 'countries#index'
    get 'categories' => 'categories#index'
    get 'projects' => 'projects#index'
    get 'projects/:id' => 'projects#show'
    get 'contracts' => 'contracts#index'
    get 'contracts/:id' => 'contracts#show', as: :contract

    post 'tasks/:id/sugession' => 'task_suggestions#create'
    delete 'tasks/:id/sugession/:id' => 'task_suggestions#destroy'
    get 'tasks/:id/sugessions/' => 'task_suggestions#index'

    post 'tasks/:id/favorite_tasks' => 'favorite_tasks#create'
    delete 'tasks/:id/favorite_tasks' => 'favorite_tasks#destroy'

    get 'favorites_tasks' => 'favorite_tasks#index'

    get 'places' => 'places#index'
    get 'tasks/:id/place' => 'places#show'

    post 'tasks/:id/ratings' => 'ratings#create'

    post 'tasks/:id/statuses' => 'tasks#change_task_status'
    post 'users/:id/ratings' => 'ratings#show'

    post 'tasks/:id/message' => 'messages#create'
    get 'tasks/:id/messages/concierge' => 'messages#concierge_task_messages'
    get 'tasks/:id/messages/hire' => 'messages#hire_task_messages'

    get 'tasks/:id/messages/new_list' => 'messages#new_messages'

    get '/sugessions/:id/messages/' => 'messages#sugesstion_messages'
    get 'sugessions/:id' => 'task_suggestions#show'

    get 'payments/hire' => 'task_payments#hire_payments'
    get 'payments/concierge' => 'task_payments#concierge_payments'
    get 'payments/cashout_list' => 'task_payments#cashouts_lis'

    post 'payments/transfer' => 'task_payments#money_transfer'
    post 'payments/cashout' => 'task_payments#cashout'

    post 'tasks/:id/line_tasks' => 'line_tasks#create'
    post 'line_tasks/:id' => 'line_tasks#update'
    delete 'line_tasks/:id' => 'line_tasks#destroy'
    get 'line_tasks/:id' => 'line_tasks#show'

    resources :complaints
    resources :work_zones, only: :index
    resources :supervisors, only: :index
  end

  mount ActionCable.server => '/cable'
  # end


  ###

end
