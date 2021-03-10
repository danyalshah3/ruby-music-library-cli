class Artist < Song

attr_accessor :name, :songs

@@all = []

def self.all
    @@all
end

def initialize(name)
    @name = name
  save
end
def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
end

def songs
    Song.all.select {|song| song.artist == self}

    
end

def add_song(song)
    
  if song.artist != self
        song.artist = self 
 
    end
end

def save
    @@all << self
end

def self.destroy_all
    @@all.clear
end
end