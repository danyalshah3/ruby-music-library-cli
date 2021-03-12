class Artist 
    extend Concerns::Findable
    
    

attr_accessor :name, :song, :genre

@@all = []

def self.all
    @@all
end

def initialize(name)
    @name = name
  
end
def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
end

def songs
    Song.all.select {|song| song.artist == self}

    
end

def genres
   
   songs.collect {|song| song.genre}.uniq
end

def add_song(song)

  if !song.artist 
        song.artist = self 

    end
end

def save
    self.class.all << self
end

def self.destroy_all
    @@all.clear
end
end