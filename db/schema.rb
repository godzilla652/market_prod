# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_30_113308) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresscs", id: :serial, force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "province"
    t.string "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assigns", force: :cascade do |t|
    t.integer "assign_count"
    t.bigint "contract_id"
    t.string "assignable_type"
    t.bigint "assignable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignable_type", "assignable_id"], name: "index_assigns_on_assignable_type_and_assignable_id"
    t.index ["contract_id"], name: "index_assigns_on_contract_id"
  end

  create_table "business_partners", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "addressc_id"
    t.integer "business_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressc_id"], name: "index_business_partners_on_addressc_id"
    t.index ["business_id"], name: "index_business_partners_on_business_id"
  end

  create_table "businesses", id: :serial, force: :cascade do |t|
    t.string "type_one"
    t.date "date_corporation"
    t.string "name"
    t.string "number_employees"
    t.boolean "union_affiliated"
    t.string "union_text"
    t.integer "addressc_id"
    t.integer "contract_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name_p"
    t.string "name_sp"
    t.date "date_corporation_p"
    t.index ["addressc_id"], name: "index_businesses_on_addressc_id"
    t.index ["contract_id"], name: "index_businesses_on_contract_id"
  end

  create_table "cash_out_payments", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.datetime "apply"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "amount"
    t.float "persents"
    t.string "ppal_email"
    t.string "pay_system"
    t.string "card_number"
  end

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "typec"
  end

  create_table "complaints", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "complaint_types"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "owner_id"
    t.integer "task_id"
  end

  create_table "contracts", id: :serial, force: :cascade do |t|
    t.string "contractor_name"
    t.string "type_work"
    t.string "legal_title"
    t.integer "mailing_address_id"
    t.integer "remittance_address_id"
    t.string "contact_name"
    t.string "email"
    t.string "password"
    t.string "telephone"
    t.string "gst"
    t.string "authority_person_name"
    t.string "authority_person_phone"
    t.string "serv_req_name"
    t.string "serv_req_email"
    t.string "serv_req_phone"
    t.string "bil_req_name"
    t.string "bil_req_email"
    t.string "bil_req_phone"
    t.string "full_name"
    t.string "title"
    t.date "date_submitted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.integer "user_id"
    t.boolean "check_sub"
    t.boolean "check_fin"
    t.boolean "check_sert"
    t.boolean "check_ins"
    t.boolean "check_bus"
    t.boolean "check_bond"
    t.boolean "check_cont"
    t.boolean "check_work"
    t.boolean "check_exp"
    t.string "bussines_bil_req_phone"
    t.string "bussines_serv_req_phone"
    t.boolean "team"
    t.string "city"
    t.string "sin"
    t.integer "sub_contract_id"
    t.index ["sub_contract_id"], name: "index_contracts_on_sub_contract_id"
    t.index ["user_id"], name: "index_contracts_on_user_id"
  end

  create_table "countries", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "devices", id: :serial, force: :cascade do |t|
    t.integer "owner_id"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dialogs", id: :serial, force: :cascade do |t|
    t.integer "suggestion_id"
    t.integer "hire_id"
    t.integer "concierge_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "display_views", force: :cascade do |t|
    t.string "name"
    t.bigint "viewable_id"
    t.string "viewable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["viewable_id", "viewable_type"], name: "index_display_views_on_viewable_id_and_viewable_type"
  end

  create_table "equipment", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id"
    t.text "description"
    t.integer "total_owned"
    t.integer "available"
    t.integer "assigned"
    t.integer "damaged"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_equipment_on_category_id"
  end

  create_table "estimator_types", force: :cascade do |t|
    t.string "name"
    t.text "admin_descr"
    t.boolean "active"
    t.boolean "widget"
    t.boolean "standard_field"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin_dv"
  end

  create_table "estimators", force: :cascade do |t|
    t.string "city"
    t.string "address"
    t.string "name"
    t.string "phone"
    t.string "email"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.boolean "archive"
    t.string "status_work"
    t.string "work_order"
    t.bigint "project_task_id"
    t.integer "supervisor_id"
    t.integer "estimator_type_id"
    t.index ["project_task_id"], name: "index_estimators_on_project_task_id"
  end

  create_table "favorite_tasks", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feed_notifications", id: :serial, force: :cascade do |t|
    t.integer "owner_id"
    t.integer "user_id"
    t.string "notification_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "task_title"
    t.text "message"
    t.integer "task_id"
    t.integer "suggestion_id"
    t.integer "sent", default: 0
    t.integer "task_owner_id"
  end

  create_table "field_estimators", force: :cascade do |t|
    t.bigint "fieldable_id"
    t.string "fieldable_type"
    t.string "name"
    t.string "name_scope"
    t.string "machine_name"
    t.boolean "active"
    t.string "type_field"
    t.text "desc"
    t.decimal "default_value", precision: 19, scale: 2
    t.decimal "astra_price", precision: 19, scale: 2
    t.decimal "trade_price", precision: 19, scale: 2
    t.string "ancestry"
    t.boolean "required"
    t.boolean "multiple"
    t.text "style_cls"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.bigint "field_estimator_id"
    t.jsonb "option"
    t.integer "depend_id"
    t.string "dv_name"
    t.index ["ancestry"], name: "index_field_estimators_on_ancestry"
    t.index ["depend_id"], name: "index_field_estimators_on_depend_id"
    t.index ["field_estimator_id"], name: "index_field_estimators_on_field_estimator_id"
    t.index ["fieldable_type", "fieldable_id"], name: "index_field_estimators_on_fieldable_type_and_fieldable_id"
  end

  create_table "financials", id: :serial, force: :cascade do |t|
    t.integer "contract_id"
    t.string "bank"
    t.string "addressc"
    t.string "contact"
    t.string "phone"
    t.string "email"
    t.string "acct"
    t.string "transist"
    t.string "institution"
    t.string "bonding_company"
    t.string "bc_limit"
    t.string "bc_address"
    t.string "bc_contact"
    t.string "bc_phone"
    t.string "bc_email"
    t.string "insurance_company"
    t.string "ic_address"
    t.string "ic_general_laibility"
    t.date "ic_expiry"
    t.string "ic_email"
    t.string "ic_wcb"
    t.boolean "other_work_astra"
    t.string "other_property_name"
    t.string "other_property_address"
    t.string "other_contact"
    t.string "other_phone"
    t.string "other_phone_alt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ins_cert_file_name"
    t.string "ins_cert_content_type"
    t.bigint "ins_cert_file_size"
    t.datetime "ins_cert_updated_at"
    t.string "wcb_cert_file_name"
    t.string "wcb_cert_content_type"
    t.bigint "wcb_cert_file_size"
    t.datetime "wcb_cert_updated_at"
    t.boolean "bc_n_a"
    t.string "void_check_file_name"
    t.string "void_check_content_type"
    t.bigint "void_check_file_size"
    t.datetime "void_check_updated_at"
    t.string "ic_phone"
    t.index ["contract_id"], name: "index_financials_on_contract_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.string "payable_type"
    t.integer "payable_id"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payable_type", "payable_id"], name: "index_invoices_on_payable_type_and_payable_id", unique: true
  end

  create_table "item_line_dvs", force: :cascade do |t|
    t.bigint "field_estimator_id"
    t.bigint "line_dv_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["field_estimator_id"], name: "index_item_line_dvs_on_field_estimator_id"
    t.index ["line_dv_id"], name: "index_item_line_dvs_on_line_dv_id"
  end

  create_table "line_dvs", force: :cascade do |t|
    t.string "name"
    t.string "type_line"
    t.bigint "display_view_id"
    t.bigint "line_dv_id"
    t.boolean "calc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "prestage"
    t.index ["display_view_id"], name: "index_line_dvs_on_display_view_id"
    t.index ["line_dv_id"], name: "index_line_dvs_on_line_dv_id"
  end

  create_table "line_estimators", force: :cascade do |t|
    t.string "value"
    t.bigint "field_estimator_id"
    t.bigint "estimator_id"
    t.bigint "task_id"
    t.decimal "astra_total"
    t.decimal "trade_total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estimator_id"], name: "index_line_estimators_on_estimator_id"
    t.index ["field_estimator_id"], name: "index_line_estimators_on_field_estimator_id"
    t.index ["task_id"], name: "index_line_estimators_on_task_id"
  end

  create_table "line_tasks", id: :serial, force: :cascade do |t|
    t.string "title"
    t.decimal "budget", precision: 19, scale: 2
    t.string "type_line"
    t.string "status"
    t.integer "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_line_tasks_on_task_id"
  end

  create_table "maintenances", force: :cascade do |t|
    t.string "title", limit: 25
    t.date "date"
    t.bigint "vehicle_id"
    t.boolean "done", default: false
    t.string "contractor_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_id"], name: "index_maintenances_on_vehicle_id"
  end

  create_table "messages", id: :serial, force: :cascade do |t|
    t.integer "author_id"
    t.integer "recipient_id"
    t.text "message_body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "task_id"
    t.integer "suggestion_id"
    t.boolean "system", default: false
    t.boolean "rating", default: false, null: false
    t.float "points"
    t.boolean "give_a_rate", default: false, null: false
    t.string "file_file_name"
    t.string "file_content_type"
    t.bigint "file_file_size"
    t.datetime "file_updated_at"
    t.string "type_message"
    t.integer "id_line_task"
    t.string "title"
    t.integer "budget"
    t.string "type_line"
    t.string "status"
    t.integer "budget_task"
    t.decimal "total"
  end

  create_table "oauth_access_grants", id: :serial, force: :cascade do |t|
    t.integer "resource_owner_id", null: false
    t.integer "application_id", null: false
    t.string "token", null: false
    t.integer "expires_in", null: false
    t.text "redirect_uri", null: false
    t.datetime "created_at", null: false
    t.datetime "revoked_at"
    t.string "scopes"
    t.index ["token"], name: "index_oauth_access_grants_on_token", unique: true
  end

  create_table "oauth_access_tokens", id: :serial, force: :cascade do |t|
    t.integer "resource_owner_id"
    t.integer "application_id"
    t.string "token", null: false
    t.string "refresh_token"
    t.integer "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.string "scopes"
    t.string "previous_refresh_token", default: "", null: false
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true
  end

  create_table "oauth_applications", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "uid", null: false
    t.string "secret", null: false
    t.text "redirect_uri", null: false
    t.string "scopes", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true
  end

  create_table "permissions", id: :serial, force: :cascade do |t|
    t.string "action"
    t.string "subject_class"
    t.integer "subject_id"
    t.boolean "active"
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id", "action", "subject_class"], name: "index_permissions_on_role_id_and_action_and_subject_class", unique: true
    t.index ["role_id"], name: "index_permissions_on_role_id"
  end

  create_table "places", id: :serial, force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.integer "task_id"
    t.integer "country_id"
    t.string "city"
    t.string "state"
    t.text "address"
    t.string "apartment"
  end

  create_table "project_tasks", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "type_pt"
    t.text "description"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number"
  end

  create_table "projects", id: :serial, force: :cascade do |t|
    t.string "description"
    t.string "year_completion"
    t.string "value"
    t.string "owner_name"
    t.integer "project_address_id"
    t.string "owner_contact_one"
    t.string "phone_one"
    t.string "email_one"
    t.string "owner_contact_two"
    t.string "consultant_two"
    t.string "phone_two"
    t.string "email_two"
    t.integer "contract_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "check_past"
    t.index ["contract_id"], name: "index_projects_on_contract_id"
  end

  create_table "quick_books_integrations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "tokens", default: {}
    t.datetime "access_token_expired_at"
  end

  create_table "ratings", id: :serial, force: :cascade do |t|
    t.integer "task_id"
    t.integer "points"
    t.boolean "positive"
    t.boolean "negative"
    t.integer "concierge_id"
    t.integer "hire_id"
    t.boolean "hire", default: false, null: false
    t.boolean "concierge", default: false, null: false
  end

  create_table "roles", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
  end

  create_table "settings", id: :serial, force: :cascade do |t|
    t.string "var", null: false
    t.text "value"
    t.integer "thing_id"
    t.string "thing_type", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true
  end

  create_table "task_payments", id: :serial, force: :cascade do |t|
    t.integer "task_id"
    t.integer "user_id"
    t.boolean "hire"
    t.boolean "concierge"
    t.float "persents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "budget"
    t.string "payment_method"
  end

  create_table "task_requests", id: :serial, force: :cascade do |t|
  end

  create_table "task_suggestions", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "task_id"
    t.text "proposed_text"
    t.decimal "price", precision: 19, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "hire_read", default: false
    t.boolean "concierge_read", default: true
  end

  create_table "tasks", id: :serial, force: :cascade do |t|
    t.integer "owner_id"
    t.integer "concierge_id"
    t.string "title"
    t.string "status"
    t.string "task_type"
    t.text "description"
    t.string "phone"
    t.datetime "date_limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.bigint "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer "suggestions_counter"
    t.integer "suggestion_id"
    t.decimal "budget", precision: 19, scale: 2
    t.datetime "completed_at"
    t.datetime "confirmed_at"
    t.string "photo1_file_name"
    t.string "photo1_content_type"
    t.bigint "photo1_file_size"
    t.datetime "photo1_updated_at"
    t.string "photo2_file_name"
    t.string "photo2_content_type"
    t.bigint "photo2_file_size"
    t.datetime "photo2_updated_at"
    t.string "photo3_file_name"
    t.string "photo3_content_type"
    t.bigint "photo3_file_size"
    t.datetime "photo3_updated_at"
    t.string "photo4_file_name"
    t.string "photo4_content_type"
    t.bigint "photo4_file_size"
    t.datetime "photo4_updated_at"
    t.string "photo5_file_name"
    t.string "photo5_content_type"
    t.bigint "photo5_file_size"
    t.datetime "photo5_updated_at"
    t.string "photo6_file_name"
    t.string "photo6_content_type"
    t.bigint "photo6_file_size"
    t.datetime "photo6_updated_at"
    t.string "photo7_file_name"
    t.string "photo7_content_type"
    t.bigint "photo7_file_size"
    t.datetime "photo7_updated_at"
    t.integer "project_task_id"
    t.boolean "tender"
    t.string "apartment", default: ""
    t.date "date_start"
    t.date "fact_start"
    t.date "fact_end"
    t.string "city"
    t.string "pay_state"
    t.index ["project_task_id"], name: "index_tasks_on_project_task_id"
  end

  create_table "trades", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "range"
    t.integer "financial_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["financial_id"], name: "index_trades_on_financial_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.bigint "photo_file_size"
    t.datetime "photo_updated_at"
    t.string "first_name"
    t.string "last_name"
    t.string "street"
    t.string "city"
    t.string "postal_code"
    t.string "phone1"
    t.string "phone2"
    t.string "facebook_id"
    t.string "facebook_token"
    t.string "cardholder_name"
    t.string "card_number"
    t.integer "cvk"
    t.integer "exp_month"
    t.integer "exp_year"
    t.integer "country_id", default: 0, null: false
    t.text "description"
    t.float "balance", default: 0.0
    t.datetime "blocked_to"
    t.string "unlock_token"
    t.datetime "locked_at"
    t.boolean "is_logged_in", default: false
    t.string "token_web"
    t.jsonb "coordinates", default: {}
    t.datetime "coordinates_updated_at"
    t.string "last_address"
    t.bigint "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "users_pendings_tasks", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "task_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "fleet"
    t.integer "year"
    t.string "make"
    t.integer "km"
    t.string "license"
    t.date "since"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "added", default: false
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.text "object_changes"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  create_table "work_zone_visit_logs", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "work_zone_id"
    t.datetime "time_from"
    t.datetime "time_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.index ["user_id"], name: "index_work_zone_visit_logs_on_user_id"
    t.index ["work_zone_id"], name: "index_work_zone_visit_logs_on_work_zone_id"
  end

  create_table "work_zones", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "spot_one"
    t.string "spot_two"
    t.string "spot_three"
    t.string "spot_four"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "business_partners", "addresscs"
  add_foreign_key "business_partners", "businesses"
  add_foreign_key "businesses", "addresscs"
  add_foreign_key "businesses", "contracts"
  add_foreign_key "contracts", "users"
  add_foreign_key "equipment", "categories"
  add_foreign_key "estimators", "project_tasks"
  add_foreign_key "field_estimators", "field_estimators"
  add_foreign_key "financials", "contracts"
  add_foreign_key "item_line_dvs", "field_estimators"
  add_foreign_key "item_line_dvs", "line_dvs"
  add_foreign_key "line_dvs", "display_views"
  add_foreign_key "line_dvs", "line_dvs"
  add_foreign_key "line_estimators", "estimators"
  add_foreign_key "line_estimators", "field_estimators"
  add_foreign_key "line_estimators", "tasks"
  add_foreign_key "line_tasks", "tasks"
  add_foreign_key "oauth_access_grants", "oauth_applications", column: "application_id"
  add_foreign_key "oauth_access_tokens", "oauth_applications", column: "application_id"
  add_foreign_key "permissions", "roles"
  add_foreign_key "projects", "contracts"
  add_foreign_key "tasks", "project_tasks"
  add_foreign_key "trades", "financials"
  add_foreign_key "users", "roles"
  add_foreign_key "work_zone_visit_logs", "users"
  add_foreign_key "work_zone_visit_logs", "work_zones"
end
