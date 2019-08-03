class Cart 
  @@cart = []
  
  def initialize(name)
    @name = name
  end
  
  def self.all 
    @@cart 
  end 
end 