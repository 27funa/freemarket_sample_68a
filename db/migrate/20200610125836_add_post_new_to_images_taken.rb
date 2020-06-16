class AddPostNewToImagesTaken < ActiveRecord::Migration[5.2]
  def change
    add_column :posts ,:image_taken,:string
  end
end
