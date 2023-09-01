# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_08_31_090830) do

  create_table "active_consent_questionnaire_templates", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "collection_protocol_id"
    t.bigint "questionnaires_template_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["collection_protocol_id"], name: "fk_rails_fac48eb566"
    t.index ["questionnaires_template_id"], name: "fk_rails_496d29ae52"
  end

  create_table "additional_files", charset: "utf8mb3", force: :cascade do |t|
    t.integer "obj_id"
    t.string "obj_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file_file_name"
    t.string "file_content_type"
    t.integer "file_file_size"
    t.datetime "file_updated_at"
    t.index ["obj_id"], name: "index_additional_files_on_obj_id"
    t.index ["obj_type"], name: "index_additional_files_on_obj_type"
  end

  create_table "additional_infos", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.integer "obj_id"
    t.string "obj_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["obj_id"], name: "index_additional_infos_on_obj_id"
    t.index ["obj_type"], name: "index_additional_infos_on_obj_type"
  end

  create_table "alerts", charset: "utf8mb3", force: :cascade do |t|
    t.integer "alertable_id"
    t.string "alertable_type"
    t.datetime "at_datetime"
    t.text "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "user"
  end

  create_table "alerts_users", charset: "utf8mb3", force: :cascade do |t|
    t.integer "alert_id"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "audits", charset: "utf8mb3", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.text "audited_changes", size: :medium
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.datetime "created_at"
    t.string "request_uuid"
    t.json "audit_json"
    t.index ["associated_id", "associated_type"], name: "associated_index"
    t.index ["auditable_id", "auditable_type"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "collection_protocols", charset: "utf8mb3", force: :cascade do |t|
    t.date "start_date"
    t.string "ethics_number"
    t.string "status", limit: 32, default: "Active"
    t.string "short_protocol_name"
    t.string "registration_identifier_template"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "label_project"
    t.string "short_label_name"
    t.string "special_label", limit: 25
  end

  create_table "general_lists", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "listable_id"
    t.string "listable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hazard_types", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hazards", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "sample_id"
    t.string "hazard_type"
    t.text "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["sample_id"], name: "fk_rails_86f585b65c"
  end

  create_table "identifier_types", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "list_items", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "general_list_id"
    t.integer "item_id"
    t.string "item_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["general_list_id"], name: "fk_rails_542131d536"
  end

  create_table "locations", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patient_identifiers", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "patient_id"
    t.string "identifier_type"
    t.string "identifier"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["patient_id"], name: "fk_rails_2af48d016d"
  end

  create_table "patients", charset: "utf8mb3", force: :cascade do |t|
    t.string "firstname"
    t.string "surname"
    t.date "dob"
    t.date "dod"
    t.string "gender"
    t.string "vital_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.text "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questionnaires_forms", charset: "utf8mb3", force: :cascade do |t|
    t.date "signed_date"
    t.string "witness_name"
    t.bigint "registration_to_cp_id"
    t.string "scanned_uri"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "qc_performed"
    t.string "template_name"
    t.index ["registration_to_cp_id"], name: "fk_rails_9a0a141386"
  end

  create_table "questionnaires_questions", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "consent_questionnaire_template_id"
    t.integer "position"
    t.text "question"
    t.string "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["consent_questionnaire_template_id"], name: "fk_rails_7785abbe56"
  end

  create_table "questionnaires_responses", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "questionnaires_form_id"
    t.string "answer"
    t.bigint "questionnaires_question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["questionnaires_form_id"], name: "fk_rails_cc0f837155"
    t.index ["questionnaires_question_id"], name: "fk_rails_bd4854fe1a"
  end

  create_table "questionnaires_templates", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registration_to_cps", charset: "utf8mb3", force: :cascade do |t|
    t.date "date"
    t.bigint "patient_id"
    t.string "registration_identifier"
    t.bigint "collection_protocol_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.json "tree"
    t.index ["collection_protocol_id"], name: "fk_rails_4b4ec0adae"
    t.index ["patient_id"], name: "fk_rails_35cc2d9651"
  end

  create_table "sample_collection_templates", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "collection_protocol_id"
    t.string "status", limit: 32, default: "Active"
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "timepoint_type", limit: 70
    t.index ["collection_protocol_id"], name: "fk_rails_4bd4722da8"
  end

  create_table "sample_collections", charset: "utf8mb3", force: :cascade do |t|
    t.integer "location_id"
    t.bigint "registration_to_cp_id"
    t.string "study_point_name"
    t.date "collection_date"
    t.string "status", limit: 32, default: "Active"
    t.string "diagnosis"
    t.string "pathology_number"
    t.string "clinical_status"
    t.text "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "collection_status"
    t.string "not_collected_reason"
    t.index ["registration_to_cp_id"], name: "fk_rails_e19f133df5"
  end

  create_table "sample_extra_identifiers", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "sample_id"
    t.string "name"
    t.string "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["sample_id"], name: "fk_rails_77621f5a7e"
  end

  create_table "sample_hazard_types", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.integer "hazard_type_id"
    t.integer "sample_id"
  end

  create_table "sample_histories", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "sample_id"
    t.datetime "happened_at"
    t.integer "user_id"
    t.text "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "sample_event"
    t.index ["sample_id"], name: "fk_rails_91c6dc58f3"
  end

  create_table "sample_list_samples", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "sample_list_id"
    t.bigint "sample_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["sample_id"], name: "fk_rails_b4e9bafa6f"
    t.index ["sample_list_id"], name: "fk_rails_134949c1be"
  end

  create_table "sample_lists", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sample_templates", charset: "utf8mb3", force: :cascade do |t|
    t.string "label_format"
    t.integer "parent_sample_template_id"
    t.string "relationship_to_parent"
    t.float "initial_quantity"
    t.string "status", limit: 32, default: "Active"
    t.bigint "sample_collection_template_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "sample_type"
    t.string "sample_class"
    t.string "pathology_status"
    t.string "site"
    t.string "side"
    t.string "availability"
    t.index ["sample_collection_template_id"], name: "fk_rails_979a6342cc"
  end

  create_table "samples", charset: "utf8mb3", force: :cascade do |t|
    t.string "label"
    t.string "barcode"
    t.bigint "sample_collection_id"
    t.integer "parent_id"
    t.string "relationship_to_parent"
    t.float "initial_quantity"
    t.float "available_quantity"
    t.text "comments"
    t.string "status", limit: 32, default: "Active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "born_on"
    t.string "sample_type"
    t.string "sample_class"
    t.string "pathology_status"
    t.string "site"
    t.string "side"
    t.string "availability"
    t.index ["availability"], name: "index_samples_on_availability"
    t.index ["barcode"], name: "idx_specimens_barcode"
    t.index ["label"], name: "idx_specimens_label"
    t.index ["sample_collection_id"], name: "fk_rails_0cfc761e76"
  end

  create_table "search_criteria", charset: "utf8mb3", force: :cascade do |t|
    t.string "model"
    t.string "uuid"
    t.string "criteria"
    t.string "style"
    t.string "name"
    t.string "user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", charset: "utf8mb3", force: :cascade do |t|
    t.string "session_id", null: false
    t.string "cas_ticket"
    t.text "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["cas_ticket"], name: "index_sessions_on_cas_ticket"
    t.index ["session_id"], name: "index_sessions_on_session_id"
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "shipment_containers", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "shipment_id"
    t.bigint "stores_container_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["shipment_id"], name: "fk_rails_a72d2d960f"
    t.index ["stores_container_id"], name: "fk_rails_471f11af7c"
  end

  create_table "shipment_samples", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "shipment_id"
    t.bigint "sample_id"
    t.boolean "consent_checked"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["sample_id"], name: "fk_rails_0fcfc597b3"
    t.index ["shipment_id"], name: "fk_rails_c72c1f7585"
  end

  create_table "shipments", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.text "to"
    t.string "barcode"
    t.string "status", limit: 32, default: "Active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "lab_id"
    t.string "tr_sr_id"
    t.index ["lab_id"], name: "index_shipments_on_lab_id"
    t.index ["tr_sr_id"], name: "index_shipments_on_tr_sr_id"
  end

  create_table "stores_containers", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "stores_template_id"
    t.string "name"
    t.bigint "collection_protocol_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "size_x"
    t.integer "size_y"
    t.string "barcode"
    t.string "parent"
    t.string "ancestors"
    t.index ["collection_protocol_id"], name: "fk_rails_b236fec2dd"
    t.index ["stores_template_id"], name: "fk_rails_eada6cd9f9"
  end

  create_table "stores_positions", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "stores_container_id"
    t.string "position_x", limit: 5
    t.string "position_y", limit: 5
    t.string "content_type"
    t.string "content_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "content_name"
    t.index ["content_id", "content_type"], name: "idx_content"
    t.index ["stores_container_id"], name: "fk_rails_be5892c1b3"
  end

  create_table "stores_templates", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "label_x"
    t.string "label_y"
    t.integer "size_x"
    t.integer "size_y"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "username"
    t.datetime "last_logged_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "active_consent_questionnaire_templates", "collection_protocols"
  add_foreign_key "active_consent_questionnaire_templates", "questionnaires_templates"
  add_foreign_key "hazards", "samples"
  add_foreign_key "list_items", "general_lists"
  add_foreign_key "patient_identifiers", "patients"
  add_foreign_key "questionnaires_forms", "registration_to_cps"
  add_foreign_key "questionnaires_questions", "questionnaires_templates", column: "consent_questionnaire_template_id"
  add_foreign_key "questionnaires_responses", "questionnaires_forms"
  add_foreign_key "questionnaires_responses", "questionnaires_questions"
  add_foreign_key "registration_to_cps", "collection_protocols"
  add_foreign_key "registration_to_cps", "patients"
  add_foreign_key "sample_collection_templates", "collection_protocols"
  add_foreign_key "sample_collections", "registration_to_cps"
  add_foreign_key "sample_extra_identifiers", "samples"
  add_foreign_key "sample_histories", "samples"
  add_foreign_key "sample_list_samples", "sample_lists"
  add_foreign_key "sample_list_samples", "samples"
  add_foreign_key "sample_templates", "sample_collection_templates"
  add_foreign_key "samples", "sample_collections"
  add_foreign_key "shipment_containers", "shipments"
  add_foreign_key "shipment_containers", "stores_containers"
  add_foreign_key "shipment_samples", "samples"
  add_foreign_key "shipment_samples", "shipments"
  add_foreign_key "stores_containers", "collection_protocols"
  add_foreign_key "stores_containers", "stores_templates"
  add_foreign_key "stores_positions", "stores_containers"
end
