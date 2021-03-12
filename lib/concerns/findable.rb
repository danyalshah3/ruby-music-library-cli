module Concerns::Findable

    module ClassMethods
    
    def find_by_name(song_name)
        self.all.detect {|song| song.name == song_name}
    
end
end
end