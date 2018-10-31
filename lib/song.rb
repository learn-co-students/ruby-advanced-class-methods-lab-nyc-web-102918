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
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.new
    song.name = title
    @@all << song
    song
  end

  def self.find_by_name(title)
    self.all.find do |element|
      element.name == title
    end
  end

  def self.find_or_create_by_name(title)
    if self.find_by_name(title)
      self.find_by_name(title)
    else
      self.create_by_name(title)
    end
  end

  def self.alphabetical
    @@all.sort_by! do |element|
      element.name.downcase
    end
  end

  def self.new_from_filename(file)
    newAr = file.split(" - ")
    newAr[1].slice!(".mp3")
    song = self.new
    song.name = newAr[1]
    song.artist_name = newAr[0]
    song
  end

  def self.create_from_filename(file)
    newAr = file.split(" - ")
    newAr[1].slice!(".mp3")
    song = self.new
    song.name = newAr[1]
    song.artist_name = newAr[0]
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear

  end





end
