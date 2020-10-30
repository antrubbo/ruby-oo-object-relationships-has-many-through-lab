require 'pry'

class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def new_song(name, genre)
        song = Song.new(name, self, genre)
    end

    def genres
        genre_list = []
        songs.each do |song|
            if song.artist == self
                genre_list << song.genre
            end
        end
        genre_list
    end

end #class Artist