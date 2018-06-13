require 'pry'
class Song
attr_accessor :name, :artist, :genre

@@all = []

def initialize(name, artist = nil, genre = nil)
  @name = name
  if artist != nil
  self.artist = artist
end
if genre != nil
  self.genre = genre
end
end

def self.all
  @@all
end

def save
  @@all << self
end

def self.create(name)
  song = self.new(name)
song.name = name
song.save
song
end

def self.destroy_all
  @@all.clear
end

def self.find_by_name(name)
  self.all.detect{|song| song.name == name}
end


def self.find_or_create_by_name(name)
  if self.find_by_name(name)
    self.find_by_name(name)
  else
    self.create(name)
      end
    end

def artist=(artist)
  @artist = self.artist
  artist.add_song(self)
end

def genre=(genre)
 @genre = genre
 song = self
 if !genre.songs.include?(song)
genre.songs << self
end
end

def self.new_from_filename(filename)
  formatted_song = filename.split(' - ')
  artist = formatted_song[0].find_or_create_by_name(name)
  genre = formatted_song[2].find_or_create_by_name(name)
  new_song = self.new(formatted_song[1], artist, formatted_song[2])
  new_song
end

end
