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
    new_song = Song.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = Song.new
    new_song.name = name
    @@all << new_song
    new_song
  end

  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if !Song.find_by_name(name)
      Song.create_by_name(name)
    else
      Song.find_by_name(name)
    end
  end

  def self.new_from_filename(filename)
    artist_and_file = filename.split(" - ")
    artist = artist_and_file[0]
    file = artist_and_file[1].split(".")
    song_name = file[0]
    new_song = Song.new_by_name(song_name)
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(filename)
    artist_and_file = filename.split(" - ")
    artist = artist_and_file[0]
    file = artist_and_file[1].split(".")
    song_name = file[0]
    new_song = Song.create_by_name(song_name)
    new_song.artist_name = artist
    new_song
  end

  def self.alphabetical
    # self.all.sort do |first, second|
    #   first.name <=> second.name
    # end
    self.all.sort_by do |song|
      song.name 
    end
  end

  def self.destroy_all
    self.all.clear
  end

end
