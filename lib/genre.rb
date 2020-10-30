require 'pry'

class Genre
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def songs
        Song.all.select {|song| song.genre == self}
    end

    def artists
        artist_list = []
        songs.each do |song|
            if song.genre == self
                artist_list << song.artist
            end
        end
        artist_list
    end

    def self.all
        @@all
    end

end