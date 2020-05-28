class CreateDeliveryInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_informations do |t|
      t.string :family_name,             null:false
      t.string :first_name,             null:false
      t.string :family_name_kana,             null:false
      t.string :first_name_kana,             null:false
      t.integer :postal_code,             null:false
      t.string :state,             null:false
      t.string :city,             null:false
      t.string :address_line_1,             null:false
      t.string :address_line_2
      t.string :tel
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
