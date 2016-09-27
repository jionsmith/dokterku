class AddPhotoFileUrlInUser < ActiveRecord::Migration
  def change
    add_column :users, :photo_url, :string
    add_column :users, :photo_thumb_url, :string
  end
end
