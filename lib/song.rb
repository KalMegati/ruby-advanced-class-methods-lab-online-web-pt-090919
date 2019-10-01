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
    instance = self.new
    instance.save
    instance
  end
  
  def self.new_by_name(name)
    instance = self.new
    instance.name = name
    instance
  end
  
  def self.create_by_name(name)
    instance = self.create
    instance.name = name
    instance
  end
  
  def self.find_by_name(name)
    @@all.find { |tune| tune.name == name }
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    @@all.sort { |a, b| a.name <=> b.name }
  end
  
  def self.new_from_filename(mpthree)
    parsed = mpthree.split(" - ")
    parsed[1].chomp!(".mp3")
    instance = self.create_by_name(parsed[1])
    instance.artist = parsed[0]
    
  end
  
end
