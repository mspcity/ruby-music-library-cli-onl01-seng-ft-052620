class Artist
extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    self.new(name)
  end

  def add_song(song)
    # if song.artist != self
    if song.artist == nil
      song.artist = self
    end

    if !@songs.include?(song)
      @songs << song
    end

  end

  def genres
    self.songs.map{|song| song.genre}.uniq
  end

end