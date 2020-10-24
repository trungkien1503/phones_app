class AddMainPhotoToPhones < ActiveRecord::Migration[6.0]
  def change
    add_attachment :phones, :main_photo
  end
end
