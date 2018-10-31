require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end


  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = Song.new
    new_song.name = song_name
    new_song.save
    new_song
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
     song = self.find_by_name(song_name)
     song == nil ? self.create_by_name(song_name) : song
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    artist_song_file_array =  filename.split(" - ")
    artist_name = artist_song_file_array[0]
    song_and_file = artist_song_file_array[1]
    song_file_array = song_and_file.split(".")
    song_name = song_file_array[0]

    new_song = self.new_by_name(song_name)
    new_song.artist_name = artist_name
    new_song
  end

  def self.create_from_filename(filename)
    artist_song_file_array =  filename.split(" - ")
    artist_name = artist_song_file_array[0]
    song_and_file = artist_song_file_array[1]
    song_file_array = song_and_file.split(".")
    song_name = song_file_array[0]

    new_song = self.create_by_name(song_name)
    new_song.artist_name = artist_name
    new_song
  end

  def self.destroy_all
    self.all.clear
  end


end
