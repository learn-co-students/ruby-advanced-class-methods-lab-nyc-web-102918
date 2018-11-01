require 'pry'

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
    #initializes a song and saves it to the
    #@@all class variable either literally
    #or through the class method Song.all.
    #This method should return the song instance
    #that was initialized and saved.
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    #takes in the string name of a song and returns
    # a song instance with that name set as its name property.
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    # that takes in the string name of a song and
    #returns a song instance with that name set as
    #its name property and the song being saved into
    #the @@all class variable.
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    #accepts the string name of a song and returns
    #the matching instance of the song with that name.
    self.all.find do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    #method will accept a string name for a song and either
    #return a matching song instance with that name or create
    #a new song with the name and return the song instance.
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    #that returns all the songs in ascending
    #(a-z) alphabetical order.
    self.all.sort { |a, b| a.name <=> b.name }
  end

  def self.new_from_filename(file_name)
    song = self.create
    name_artist_array = file_name.split(" - ")
    song.artist_name = name_artist_array[0]
    song.name = name_artist_array[1].chomp(".mp3")
    song
  end

  def self.create_from_filename(file_name)
    song = self.new
    name_artist_array = file_name.split(" - ")
    song.artist_name = name_artist_array[0]
    song.name = name_artist_array[1].chomp(".mp3")
    song.save

  end

  def self.destroy_all
    #clears all the song instances from the @@all array
    self.all.clear
  end

end
