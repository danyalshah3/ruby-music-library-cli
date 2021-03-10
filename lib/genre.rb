class Genre

attr_accessor :name
    @@all = []
        def self.all
            @@all
        end
    
        def initialize(name)
            @name = name
          save
        end

        def self.create(name)
            genre = Genre.new(name)
            genre.save
            genre
        end
    
        def save
            @@all << self
        end

        def self.destroy_all
            @@all.clear
        end
    
        end