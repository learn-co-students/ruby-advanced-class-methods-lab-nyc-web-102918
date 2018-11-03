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
    new_song_instance=Song.new
    new_song_instance.save
    new_song_instance
  end

  def self.new_by_name(name)
    new_with_name=Song.new
    new_with_name.name=name
    new_with_name
  end

  def self.create_by_name(name)
    create_by_name=Song.new_by_name(name)
    create_by_name.save
    create_by_name
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    Song.create_by_name(name)
    Song.find_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    new=filename.split(" - ")
    artist_name=new[0]
    name=new[1].gsub(".mp3", "")
    new_song=self.new
    new_song.name = name
    new_song.artist_name = artist_name
    new_song
  end

  def self.create_from_filename(filename)
    create_from_filename=Song.new_from_filename(filename)
    create_from_filename.save
  end

  def self.destroy_all
    @@all.clear
  end

end #end of Class Song
