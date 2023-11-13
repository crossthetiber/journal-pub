class AddThumbnailToEssays < ActiveRecord::Migration
  def change
    add_attachment :essays, :thumbnail_image
  end
end
