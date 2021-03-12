require 'pry'
class Song 

    attr_accessor :name
    attr_reader  :artist, :genre

    @@all = []
    def self.all
        @@all
    end

    def initialize(name, artist=nil, genre=nil)
        @name = name
        # binding.pry
        self.artist = artist if artist.class == Artist
        self.genre = genre if genre.class == Genre
       
       



    end

    def save
        self.class.all << self
    end

    def self.create(name)
        song = Song.new(name)
     
        song.save
        song
    end

    def artist=(artist)
        #  binding.pry
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
    end

    def self.create(song_name)
        song = self.new(song_name)
        song.save
        song
    end


    def self.find_by_name(song_name)
            self.all.detect {|song| song.name == song_name}
        
    end

    def self.find_or_create_by_name(song_name)
        self.find_by_name(song_name) || self.create(song_name)
        # if  self.find_by_name(song_name) 
        #     song = self.find_by_name(song_name)
        # elsif self.find_by_name(song_name) == nil
        #      self.create_by_name(song_name)
             
        
    end


    def self.destroy_all
        @@all.clear
    end
end
