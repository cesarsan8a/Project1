class CreatePlaylistsSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :playlists_songs, :id => false do |t|
      t.integer :playlist_id
      t.integer :song_id
    end
  end
end
