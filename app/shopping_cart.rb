class Cart 
  @@cart = []
  
  def initialize(name)
    @name = name
    @items = []
  end
  
  def self.all 
    @@cart 
  end 
end 