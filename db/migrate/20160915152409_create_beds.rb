class CreateBeds < ActiveRecord::Migration
  def change
    create_table :beds do |t|
      t.integer :vvip, default: 0
      t.integer :vvip_free, default: 0
      t.integer :vip, default: 0
      t.integer :vip_free, default: 0
      t.integer :i, default: 0
      t.integer :i_free, default: 0
      t.integer :ii, default: 0
      t.integer :ii_free, default: 0
      t.integer :iii, default: 0
      t.integer :iii_free, default: 0
      t.integer :ruang_isolasi, default: 0
      t.integer :ruang_isolasi_free, default: 0
      t.integer :igd, default: 0
      t.integer :igd_free, default: 0
      t.integer :vk, default: 0
      t.integer :vk_free, default: 0
      t.integer :ok, default: 0
      t.integer :ok_free, default: 0
      t.integer :perinatologi, default: 0
      t.integer :perinatologi_free, default: 0
      t.integer :picu, default: 0
      t.integer :picu_free, default: 0
      t.integer :nicu, default: 0
      t.integer :nicu_free, default: 0
      t.integer :icu, default: 0
      t.integer :icu_free, default: 0
      t.integer :iccu, default: 0
      t.integer :iccu_free, default: 0
      t.integer :hcu, default: 0
      t.integer :hcu_free, default: 0
      t.references :institution, index: true
    end
  end
end
