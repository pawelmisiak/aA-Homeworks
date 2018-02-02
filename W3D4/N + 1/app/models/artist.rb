class Artist < ApplicationRecord
  has_many :albums,
    class_name: 'Album',
    foreign_key: :artist_id,
    primary_key: :id

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.title] = album.tracks.length
    end

    tracks_count
  end

  def better_tracks_query
    albums = self
      .albums
      .joins(:tracks) #joins another table
      .group('albums.id')
      .select('albums.title, COUNT(tracks.id) AS track_count')

      count = {}
      albums.each {|album| count[album.title] = album.track_count}
      count
  end
end
