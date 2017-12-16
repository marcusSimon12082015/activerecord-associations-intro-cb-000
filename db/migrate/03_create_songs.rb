class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |s|
      s.string :title
      s.integer :artist_id
      s.integer :genre_id
    end
  end
end
