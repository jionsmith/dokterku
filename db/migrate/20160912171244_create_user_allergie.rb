class CreateUserAllergie < ActiveRecord::Migration
  def change
    create_table :user_allergies do |t|
      t.string :substance
      t.string :reaction
      t.references :user, index: true
    end
  end
end
