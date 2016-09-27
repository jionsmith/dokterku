class AddDetailsInInstitutions < ActiveRecord::Migration
  def change
    change_table :institutions do |t|
      t.string :admin_mr
      t.string :nomor_kode_rs
      t.string :jenis_rumah_sakit
      t.string :kelas_rumah_sakit
      t.string :penyelenggara
      t.string :penyelenggara_rs
      t.string :nama
      t.string :status
      t.date :date_started
      t.string :pentahapan
      t.string :akreditasi_depkes
      t.date :tanggal_akreditasi
      t.string :surat_izin
      t.string :nomor_izin
      t.string :nomor_sertifikat
      t.date :tanggal
      t.string :oleh
      t.string :sifat
      t.date :masa_berlaku
      t.string :motto
      t.string :misi
      t.string :visi
      t.string :desa
      t.string :kecamatan
      t.string :rt_rw
      t.string :kabupaten
      t.string :kelurahan
      t.string :kota
      t.string :provinsi
      t.string :luas_tanah
      t.string :luas_bangunan
      t.string :maps_link
      t.string :contacts
      t.string :fax
      t.string :email
      t.string :website
      t.string :icu_no_telp
    end
    rename_column :institutions, :director_rm, :director_mr
  end
end
