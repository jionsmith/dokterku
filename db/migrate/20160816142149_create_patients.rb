class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :place_of_birth
      t.string :kelurahan
      t.string :kecamatan
      t.string :rt_rw
      t.string :provinsi
      t.string :last_education
      t.string :religion
      t.string :nationality
      t.string :blood_type
      t.string :marital_status
      t.string :id_type
      t.string :id_number
      t.string :phone_number
      t.string :mobile_number

      ## Employment information
      t.string :patient_occupation
      t.string :name_of_company
      t.string :company_address
      t.string :company_phone

      ## Family information
      t.string :father_name
      t.string :father_id_number
      t.string :father_address
      t.string :father_phone_number
      t.string :father_mobile_number
      t.string :father_email

      t.string :mother_name
      t.string :mother_id_number
      t.string :mother_address
      t.string :mother_phone_number
      t.string :mother_mobile_number
      t.string :mother_email

      t.string :spouse_name
      t.string :spouse_id_number
      t.string :spouse_address
      t.string :spouse_phone_number
      t.string :spouse_mobile_number
      t.string :spouse_email

      ## Emergency contact
      t.string :emergency_contact_name
      t.string :relationship_to_patient
      t.string :emergency_contact_address
      t.string :emergency_contact_phone_number
      t.string :emergency_contact_mobile_number
      t.string :emergency_contact_email

      ## Payment
      t.string :method_of_payment
      t.string :credit_card_number
      t.string :bpjs_number
      t.string :insurance_company
      t.string :insurance_id_number
      t.string :insurance_policy_number

      t.belongs_to :user, index: true
      t.references :hospital, index: true

      t.timestamps null: false
    end
  end
end
