class Cart 
  @@cart = []
  
  def initialize(name)
    @name = name
    @c_items = []
  end
  
  def self.all 
    @@cart 
  end 
end 