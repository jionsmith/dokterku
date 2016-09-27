class AddDetailsInHospitals < ActiveRecord::Migration
  def change
    change_table :hospitals do |t|
      t.string :number_code_rs
      t.string :type_of_hospital
      t.string :name
      t.string :hospital_class
      t.string :director_mr
      t.string :admin_mr
      t.string :organizer
      t.string :organizer_rs
      t.string :status
      t.date :date_started
      t.string :pentahapan
      t.string :accreditation_department
      t.date :accreditation_date
      t.string :determination
      t.string :license_number
      t.string :certificate_number
      t.date :sertificate_date
      t.string :certificate_by
      t.string :sifat
      t.date :validity_period
      t.string :motto
      t.string :mission
      t.string :visions
      t.string :address
      t.string :country
      t.string :district
      t.string :rt_rw
      t.string :regency
      t.string :kelurahan
      t.string :city
      t.string :province
      t.string :zip_code
      t.string :land_area
      t.string :building_area
      t.string :maps_link
      t.string :contacts
      t.string :fax
      t.string :email
      t.string :phone
      t.string :website
      t.string :icu_no_telp
    end

  end
end
