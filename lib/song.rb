require 'pry'
class Song 

    attr_accessor :name, :artist, :genre
   

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

    def self.new_from_filename(file_name)
        #binding.pry
        filename = file_name.split(" - ")
        
        #song.name = filename[1]
        
        artist = Artist.find_or_create_by_name(filename[0])
        
        genre = Genre.find_or_create_by_name(filename[2].gsub(".mp3", ""))
        #self.artist = artist
        song = Song.new(filename[1], artist, genre)
        #self.genre = (filename[2].gsub(".mp3", ""))
        
             
    end




    def self.create_from_filename(file_name)
        Song.new_from_filename(file_name).tap{ |s| s.save}
    
      end

    def self.destroy_all
        @@all.clear
    end
end
