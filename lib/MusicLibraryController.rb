require 'pry'
class MusicLibraryController

    attr_accessor :path
    def initialize(path = "./db/mp3s")
        importer = MusicImporter.new(path)
   importer.import
    
    end

    def call
        # input = ""
        # while input != exit

        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
                answer = ""
    while answer != 'exit'
      puts "What would you like to do?"
      
      answer = gets.strip.downcase
      case answer
       
      when 'list songs'
        list_songs
      when 'list artists'
        list_artists
     
      when 'list genres'
        list_genres
      when 'list artist'
        list_songs_by_artist
      when 'genre'
        list_songs_by_genre
      when 'play song'
        play_song
      when 'list artist'
        list_artist
      when "list genre"
      
        list_genre
      when "play song"
        play_song
      end
    end
  
end
   
  def list_songs
    sorted_songs = Song.all.sort {|a, b| a.name <=> b.name}
    #binding.pry
   sorted_songs.each_with_index do |song, index|
        puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end    
end

def list_artists
    sorted_artists = Artist.all.sort {|a, b| a.name <=> b.name}
    sorted_artists.each_with_index do |artist, index|
        puts "#{index+1}. #{artist.name}"
 end    
end

def list_genres
     
    Genre.all.sort {|a, b| a.name <=> b.name}.each.with_index(1) do |genre, index|
        #binding.pry
        puts "#{index}. #{genre.name}"
    end
end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        input = gets.strip
        
        Song.all.sort {|a, b| a.name <=> b.name}.each.with_index(1) do |song, index|
        if song.artist.name == input
            puts "#{index}. #{song.name} - #{song.genre.name}"
        
        end
     end
 end
end