require('pry')
class Song
  attr_accessor :name, :artist_name
  @@all = []
  def self.all
    @@all
  end

  def initialize(name=nil,artist=nil)
     if name
       @name = name
     end
    if artist
      @artist_name=artist
    end
    @@all << self
  end

  def save
    self.class.all << self

  end
  def self.create
    song=Song.new
  #  @@all << song
    song
  end

  def self.new_by_name(name)
   song=Song.new(name)
  # @@all << song
   song

  end

  def self.create_by_name(name)
   song=Song.new(name)
  # @@all << song
   song
 end

 def self.find_by_name(song_name)

   @@all.find{|song|
   song.name==song_name}
end

def self.find_or_create_by_name(song_name)
  song=self.find_by_name(song_name)
  if song

   else song=self.create_by_name(song_name)
   end
     song
  end

  def self.alphabetical
    @@all.sort_by{|song|song.name}
  end

  def self.new_from_filename(filename)
    file=filename.split(" - ")
    artist_name=file[0]
    song_name=file[1].slice(0..-5)
    Song.new(song_name, artist_name)

  end
  def self.create_from_filename(filename)
    file=filename.split(" - ")
    artist_name=file[0]
    song_name=file[1].slice(0..-5)
    song=Song.new(song_name, artist_name)

  end

  def self.destroy_all
    @@all=[]
  end


end ###
