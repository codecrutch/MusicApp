class AddAlbumIdToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :album_id, :integer, null: false
    add_column :bands, :created_at, :datetime
    add_column :bands, :updated_at, :datetime
  end
end
