class CreateSuppliersInstitutions < ActiveRecord::Migration
  def change
    create_table :suppliers_institutions do |t|
      t.references :institution
      t.references :supplier
    end
  end
end
