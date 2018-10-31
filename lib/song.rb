class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
  	song = self.new

  	song.save

  	song
  end

  def self.new_by_name(name)
  	song = self.new
  	song.name = name
  	song.save

  	song
  end

  def self.create_by_name(name)
  	self.new_by_name(name)
  end

  def self.find_by_name(name)
  	@@all.find{|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
  	song = self.find_by_name(name)
  	if song.nil?
  		song = self.create_by_name(name)
  	end
  	song
  end

  def self.alphabetical
  	@@all.sort do |a, b|
  		a.name <=> b.name
  	end
  end

  def self.new_from_filename(file)
  	song = self.new
  	data = file.split(" - ")

  	song.artist_name = data[0]
  	song.name = data[1].gsub(/\..+$/, "")
  	song.save

  	song
  end

  def self.create_from_filename(file)
  	self.new_from_filename(file)
  end

  def self.all
    @@all
  end

  def self.destroy_all
  	@@all.clear
  end

  def save
    self.class.all << self
  end
end
