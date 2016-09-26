class AdaptPhotosToAcceptVideos < ActiveRecord::Migration
  def change
    add_column :photos, :video, :boolean, null: false, default: false
    add_column :photos, :video_url, :string, null: false, default: ""
  end
end
