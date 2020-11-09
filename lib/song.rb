require "pry"
class Song
  attr_accessor :name, :artist_name
  
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new #creates and assigns song a variable
    song.save #saves song using save method defined
    song #returns the song 
  end

  def self.new_by_name(string)
    song = self.new #creates and assigns Song instance to a variable
    song.name = string  #assigns instance to string that was taken in
    song  #returns the string/song
  
  end

  def self.create_by_name(string)
    song = self.create #creates and saves by using method create  andassigns Song instance to a variable
    song.name = string  #assigns instance to string that was taken in
    song  #returns the string/song

  end

  def self.find_by_name(string) #accepts string argument
  @@all.find{|song| song.name == string} #looks in the array using a finder class method 
  end

  def self.find_or_create_by_name(string) #accepts string
    if self.find_by_name(string) == nil  #uses .find_by_name or .create_by_name without repeating the code cannot use false or != true because nil shows there is no value while the others compare values
      self.create_by_name(string)
    else self.find_by_name(string)  
  
    #else continues with create_by_name
    end
  end
  
  def self.alphabetical
    @@all.sort_by{|a| a.name} #uses array.sort to arrange 
  end

  def self.new_from_filename(filename)#accepts an argument
    song = self.new
  
    song.name = filename.chomp(".mp3").split(" - ")[1]
    song.artist_name = filename.chomp(".mp3").split(" - ")[0]
    song
    
  end

  def self.create_from_filename(filename)#accepts an argument
    song = self.create    
    song.name = filename.chomp(".mp3").split(" - ")[1]
    song.artist_name = filename.chomp(".mp3").split(" - ")[0]
    song

  end

  def self.destroy_all
    @@all = []
  end
end