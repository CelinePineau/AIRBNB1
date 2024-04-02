class AddPhotoToHomes < ActiveRecord::Migration[7.1]
  def change
    add_column :homes, :photo, :string
  end
end
