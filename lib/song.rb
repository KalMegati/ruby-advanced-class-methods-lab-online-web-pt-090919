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
  
  def self.new_by_name
  
end
