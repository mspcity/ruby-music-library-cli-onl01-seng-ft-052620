require 'pry'
class MusicImporter

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.each_child(path).map {|file| file}
  end

  def import
    files.each {|file| Song.create_from_filename(file)}
  end
end