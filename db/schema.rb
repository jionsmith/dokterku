# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160922124916) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beds", force: :cascade do |t|
    t.integer "vvip",               default: 0
    t.integer "vvip_free",          default: 0
    t.integer "vip",                default: 0
    t.integer "vip_free",           default: 0
    t.integer "i",                  default: 0
    t.integer "i_free",             default: 0
    t.integer "ii",                 default: 0
    t.integer "ii_free",            default: 0
    t.integer "iii",                default: 0
    t.integer "iii_free",           default: 0
    t.integer "ruang_isolasi",      default: 0
    t.integer "ruang_isolasi_free", default: 0
    t.integer "igd",                default: 0
    t.integer "igd_free",           default: 0
    t.integer "vk",                 default: 0
    t.integer "vk_free",            default: 0
    t.integer "ok",                 default: 0
    t.integer "ok_free",            default: 0
    t.integer "perinatologi",       default: 0
    t.integer "perinatologi_free",  default: 0
    t.integer "picu",               default: 0
    t.integer "picu_free",          default: 0
    t.integer "nicu",               default: 0
    t.integer "nicu_free",          default: 0
    t.integer "icu",                default: 0
    t.integer "icu_free",           default: 0
    t.integer "iccu",               default: 0
    t.integer "iccu_free",          default: 0
    t.integer "hcu",                default: 0
    t.integer "hcu_free",           default: 0
    t.integer "hospital_id"
  end

  add_index "beds", ["hospital_id"], name: "index_beds_on_hospital_id", using: :btree

  create_table "billings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "institution_id"
    t.integer  "visit_note_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "billings", ["institution_id"], name: "index_billings_on_institution_id", using: :btree
  add_index "billings", ["user_id"], name: "index_billings_on_user_id", using: :btree
  add_index "billings", ["visit_note_id"], name: "index_billings_on_visit_note_id", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "data"
    t.string   "type"
    t.boolean  "disabled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doctors", force: :cascade do |t|
    t.string   "speciality"
    t.time     "hours_from"
    t.time     "hours_to"
    t.string   "phone_number"
    t.string   "blood_type"
    t.float    "height"
    t.float    "weight"
    t.integer  "user_id"
    t.integer  "hospital_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "doctors", ["hospital_id"], name: "index_doctors_on_hospital_id", using: :btree
  add_index "doctors", ["user_id"], name: "index_doctors_on_user_id", using: :btree

  create_table "drugs", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.string   "type_drug"
    t.integer  "supplier_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.decimal  "supplier_price"
  end

  add_index "drugs", ["supplier_id"], name: "index_drugs_on_supplier_id", using: :btree

  create_table "hospitals", force: :cascade do |t|
    t.integer  "institution_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "number_code_rs"
    t.string   "type_of_hospital"
    t.string   "name"
    t.string   "hospital_class"
    t.string   "director_mr"
    t.string   "admin_mr"
    t.string   "organizer"
    t.string   "organizer_rs"
    t.string   "status"
    t.date     "date_started"
    t.string   "pentahapan"
    t.string   "accreditation_department"
    t.date     "accreditation_date"
    t.string   "determination"
    t.string   "license_number"
    t.string   "certificate_number"
    t.date     "sertificate_date"
    t.string   "certificate_by"
    t.string   "sifat"
    t.date     "validity_period"
    t.string   "motto"
    t.string   "mission"
    t.string   "visions"
    t.string   "address"
    t.string   "country"
    t.string   "district"
    t.string   "rt_rw"
    t.string   "regency"
    t.string   "kelurahan"
    t.string   "city"
    t.string   "province"
    t.string   "zip_code"
    t.string   "land_area"
    t.string   "building_area"
    t.string   "maps_link"
    t.string   "contacts"
    t.string   "fax"
    t.string   "email"
    t.string   "phone"
    t.string   "website"
    t.string   "icu_no_telp"
  end

  add_index "hospitals", ["institution_id"], name: "index_hospitals_on_institution_id", using: :btree

  create_table "hospitals_departments", force: :cascade do |t|
    t.integer "hospital_id"
    t.integer "department_id"
  end

  create_table "institution_departments", force: :cascade do |t|
    t.integer "institution_id"
    t.integer "department_id"
  end

  add_index "institution_departments", ["department_id"], name: "index_institution_departments_on_department_id", using: :btree
  add_index "institution_departments", ["institution_id"], name: "index_institution_departments_on_institution_id", using: :btree

  create_table "institutions", force: :cascade do |t|
    t.string   "name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "director_mr"
    t.string   "inst_type"
    t.string   "verification_number"
    t.string   "phone"
    t.string   "admin_mr"
    t.string   "nomor_kode_rs"
    t.string   "jenis_rumah_sakit"
    t.string   "kelas_rumah_sakit"
    t.string   "penyelenggara"
    t.string   "penyelenggara_rs"
    t.string   "nama"
    t.string   "status"
    t.date     "date_started"
    t.string   "pentahapan"
    t.string   "akreditasi_depkes"
    t.date     "tanggal_akreditasi"
    t.string   "surat_izin"
    t.string   "nomor_izin"
    t.string   "nomor_sertifikat"
    t.date     "tanggal"
    t.string   "oleh"
    t.string   "sifat"
    t.date     "masa_berlaku"
    t.string   "motto"
    t.string   "misi"
    t.string   "visi"
    t.string   "desa"
    t.string   "kecamatan"
    t.string   "rt_rw"
    t.string   "kabupaten"
    t.string   "kelurahan"
    t.string   "kota"
    t.string   "provinsi"
    t.string   "luas_tanah"
    t.string   "luas_bangunan"
    t.string   "maps_link"
    t.string   "contacts"
    t.string   "fax"
    t.string   "email"
    t.string   "website"
    t.string   "icu_no_telp"
    t.string   "nama_rumah_sakit"
  end

  create_table "institutions_users", force: :cascade do |t|
    t.integer "institution_id"
    t.integer "user_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.integer  "total_quantity"
    t.integer  "remaining_quantity"
    t.integer  "pharmacy_id"
    t.integer  "drug_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "inventories", ["drug_id"], name: "index_inventories_on_drug_id", using: :btree
  add_index "inventories", ["pharmacy_id"], name: "index_inventories_on_pharmacy_id", using: :btree

  create_table "logins", force: :cascade do |t|
    t.string   "ip"
    t.string   "device_type"
    t.string   "device_token"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "logins", ["user_id"], name: "index_logins_on_user_id", using: :btree

  create_table "nurses", force: :cascade do |t|
    t.string   "phone_number"
    t.string   "blood_type"
    t.float    "height"
    t.float    "weight"
    t.integer  "user_id"
    t.integer  "hospital_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "nurses", ["hospital_id"], name: "index_nurses_on_hospital_id", using: :btree
  add_index "nurses", ["user_id"], name: "index_nurses_on_user_id", using: :btree

  create_table "patients", force: :cascade do |t|
    t.string   "place_of_birth"
    t.string   "kelurahan"
    t.string   "kecamatan"
    t.string   "rt_rw"
    t.string   "provinsi"
    t.string   "last_education"
    t.string   "religion"
    t.string   "nationality"
    t.string   "blood_type"
    t.string   "marital_status"
    t.string   "id_type"
    t.string   "id_number"
    t.string   "phone_number"
    t.string   "mobile_number"
    t.string   "patient_occupation"
    t.string   "name_of_company"
    t.string   "company_address"
    t.string   "company_phone"
    t.string   "father_name"
    t.string   "father_id_number"
    t.string   "father_address"
    t.string   "father_phone_number"
    t.string   "father_mobile_number"
    t.string   "father_email"
    t.string   "mother_name"
    t.string   "mother_id_number"
    t.string   "mother_address"
    t.string   "mother_phone_number"
    t.string   "mother_mobile_number"
    t.string   "mother_email"
    t.string   "spouse_name"
    t.string   "spouse_id_number"
    t.string   "spouse_address"
    t.string   "spouse_phone_number"
    t.string   "spouse_mobile_number"
    t.string   "spouse_email"
    t.string   "emergency_contact_name"
    t.string   "relationship_to_patient"
    t.string   "emergency_contact_address"
    t.string   "emergency_contact_phone_number"
    t.string   "emergency_contact_mobile_number"
    t.string   "emergency_contact_email"
    t.string   "method_of_payment"
    t.string   "credit_card_number"
    t.string   "bpjs_number"
    t.string   "insurance_company"
    t.string   "insurance_id_number"
    t.string   "insurance_policy_number"
    t.integer  "user_id"
    t.integer  "hospital_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "patients", ["hospital_id"], name: "index_patients_on_hospital_id", using: :btree
  add_index "patients", ["user_id"], name: "index_patients_on_user_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.decimal  "amount_paid"
    t.decimal  "balance"
    t.string   "method"
    t.integer  "billing_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "payments", ["billing_id"], name: "index_payments_on_billing_id", using: :btree

  create_table "prescriptions", force: :cascade do |t|
    t.string   "dosage"
    t.string   "quantity"
    t.string   "refills"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "user_id"
    t.integer  "doctor_id"
    t.integer  "drug_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "prescriptions", ["doctor_id"], name: "index_prescriptions_on_doctor_id", using: :btree
  add_index "prescriptions", ["drug_id"], name: "index_prescriptions_on_drug_id", using: :btree
  add_index "prescriptions", ["user_id"], name: "index_prescriptions_on_user_id", using: :btree

  create_table "relatives", force: :cascade do |t|
    t.integer "user_id"
    t.string  "relative_id"
    t.string  "relative_type"
  end

  add_index "relatives", ["user_id"], name: "index_relatives_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", force: :cascade do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "business_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "supplier_code"
    t.string   "company_name"
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.string   "country"
    t.string   "rt_rw"
    t.string   "district"
    t.string   "kelurahan"
    t.string   "city"
    t.string   "province"
    t.string   "zip_code"
    t.string   "admin_mr"
  end

  create_table "suppliers_institutions", force: :cascade do |t|
    t.integer "institution_id"
    t.integer "supplier_id"
  end

  create_table "user_allergies", force: :cascade do |t|
    t.string  "substance"
    t.string  "reaction"
    t.integer "user_id"
  end

  add_index "user_allergies", ["user_id"], name: "index_user_allergies_on_user_id", using: :btree

  create_table "user_histories", force: :cascade do |t|
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "salutation"
    t.string   "gender"
    t.date     "date_of_birth"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.integer  "user_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "user_histories", ["user_id"], name: "index_user_histories_on_user_id", using: :btree

  create_table "user_photos", force: :cascade do |t|
    t.string   "path"
    t.string   "ip"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_photos", ["user_id"], name: "index_user_photos_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "rm_number"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "salutation"
    t.string   "gender"
    t.date     "date_of_birth"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "disabled",               default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "id_type"
    t.string   "home_phone"
    t.string   "mobile_phone"
    t.string   "place_of_birth"
    t.string   "blood_type"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "desa"
    t.string   "kecamatan"
    t.string   "rt_rw"
    t.string   "kabupaten"
    t.string   "kelurahan"
    t.string   "provinsi"
    t.string   "education"
    t.string   "religion"
    t.string   "nationality"
    t.string   "marital_status"
    t.string   "occupation"
    t.string   "company"
    t.string   "full_address"
    t.string   "phone"
    t.string   "photo_url"
    t.string   "photo_thumb_url"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "vendor_payments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "visit_actions", force: :cascade do |t|
    t.text     "action"
    t.decimal  "amount_owed"
    t.integer  "visit_note_id"
    t.integer  "doctor_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "therapeutic_action"
    t.string   "diagnosis_action"
    t.string   "medical_actions"
  end

  add_index "visit_actions", ["doctor_id"], name: "index_visit_actions_on_doctor_id", using: :btree
  add_index "visit_actions", ["visit_note_id"], name: "index_visit_actions_on_visit_note_id", using: :btree

  create_table "visit_allergy_histories", force: :cascade do |t|
    t.string  "substance"
    t.string  "reaction"
    t.integer "visit_note_id"
  end

  add_index "visit_allergy_histories", ["visit_note_id"], name: "index_visit_allergy_histories_on_visit_note_id", using: :btree

  create_table "visit_diagnostics", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "initial_diagnosis"
    t.string   "differential_diagnosis"
    t.string   "final_diagnosis"
    t.string   "diagnosis_of_complications"
    t.string   "second_diagnosis"
    t.integer  "visit_note_id"
  end

  add_index "visit_diagnostics", ["visit_note_id"], name: "index_visit_diagnostics_on_visit_note_id", using: :btree

  create_table "visit_icus", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "visit_inpatients", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "visit_medicines", force: :cascade do |t|
    t.string  "name"
    t.string  "type_of_drugs"
    t.string  "dosage"
    t.string  "qty"
    t.date    "start_date"
    t.date    "end_date"
    t.integer "visit_note_id"
  end

  add_index "visit_medicines", ["visit_note_id"], name: "index_visit_medicines_on_visit_note_id", using: :btree

  create_table "visit_notes", force: :cascade do |t|
    t.string   "visit_type"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "reason"
    t.string   "symptoms"
    t.string   "medical_history"
    t.string   "awareness"
    t.integer  "pulse"
    t.string   "respiratory"
    t.string   "temperature"
    t.string   "blood_pressure"
    t.string   "head"
    t.string   "eye"
    t.string   "multi"
    t.string   "tooth"
    t.string   "throat"
    t.string   "neck"
    t.string   "chest"
    t.string   "quality_heart"
    t.string   "lungs"
    t.string   "liver"
    t.string   "lien"
    t.string   "kidneys"
    t.string   "stomach"
    t.string   "contents"
    t.string   "genitals"
    t.string   "height"
    t.string   "weight"
    t.string   "bmi"
    t.string   "bp"
    t.integer  "institution_id"
  end

  add_index "visit_notes", ["institution_id"], name: "index_visit_notes_on_institution_id", using: :btree
  add_index "visit_notes", ["user_id"], name: "index_visit_notes_on_user_id", using: :btree

  create_table "visit_operations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "visit_outpatients", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "visit_therapies", force: :cascade do |t|
    t.string  "injection"
    t.string  "infusion"
    t.string  "transfusion"
    t.string  "oral"
    t.integer "visit_note_id"
  end

  add_index "visit_therapies", ["visit_note_id"], name: "index_visit_therapies_on_visit_note_id", using: :btree

end
