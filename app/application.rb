class Application

  @@items = ["Apples","Carrots","Pears"]
  @@cart = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
      end
    elsif req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)
    elsif req.path.match(/cart/)
      if @@cart.size > 0
        @@cart.each {|i| resp.write "#{i}\n"}
      else 
        resp.write "Your cart is empty"
      end 
    elsif req.path.match(/add/)
      items_to_add = req.params["a"]
      resp.write add_to_cart(items_to_add)
    else
      resp.write "Path Not Found"
    end

    resp.finish
  end

  def handle_search(search_term)
    if @@items.include?(search_term)
      return "#{search_term} is one of our items"
    else
      return "Couldn't find #{search_term}"
    end
  end
  
  def add_to_cart(items_to_add)
    items_to_add.each do |item|
      if @@items.include?(item)
        @@cart << item
        puts "Added #{item}\n"
      else 
        puts "We don't have that item"
      end
    end
  end 
end
