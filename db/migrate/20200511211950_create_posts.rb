class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|


      t.string :item_name, null:false
      t.text  :description, null:false
      t.boolean :sales_status, null:false,default: true
      t.string :brand, null:false
      t.string :size, null:false
      t.string :condition, null:false
      t.integer :price, null:false
      t.string  :shipping_area, null:false
      t.string  :arrival_days, null:false
      t.string  :postage_payment, null:false
      # t.string  :posts_status
      
      t.references :user

      t.timestamps
    end
  end
end
